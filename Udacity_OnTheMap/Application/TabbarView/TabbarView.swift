//
//  TabbarView.swift
//  Udacity_OnTheMap
//
//  Created by Work on 16/4/24.
//

import SwiftUI

struct TabbarView: View {
    
    // MARK: - Define
    enum TabbarType {
        case map
        case location
    }
    
    // MARK: - Property
    @State private var selectedTab = TabbarType.map
    @State private var mapInput: MapViewModel.Input
    @State private var locationInput: LocationListViewModel.Input
    let tabbarInput: TabbarViewModel.Input
    @ObservedObject var tabbarOutput: TabbarViewModel.Output
    
    private let mapViewModel = MapViewModel(useCase: LocationUseCase())
    private let locationListViewModel = LocationListViewModel(useCase: LocationUseCase())
    private let cancelBag = CancelBag()
    
    init(tabbarViewModel: TabbarViewModel) {
        self.mapInput = MapViewModel.Input()
        self.locationInput = LocationListViewModel.Input()
        let tabbarInput = TabbarViewModel.Input()
        tabbarOutput = tabbarViewModel.transform(tabbarInput, cancelBag: cancelBag)
        self.tabbarInput = tabbarInput
    }
    
    var body: some View {
        UdacityNavigationView(headerContent: {
            tabbarHeader
                .padding(8)
        }, bodyContent: {
            TabView(selection: $selectedTab) {
                MapView(viewModel: mapViewModel, input: mapInput)
                    .tag(TabbarType.map)
                    .tabItem {
                        Image("location")
                    }
                LocationListView(viewModel: locationListViewModel, input: locationInput)
                    .tag(TabbarType.location)
                    .tabItem {
                        Image("pin")
                    }
            }
        })
        .ignoresSafeArea(edges: .bottom)
    }
    
    private var tabbarHeader: some View {
        HStack {
            Button {
                tabbarInput.logoutAction.send()
            } label: {
                Image("logout")
            }
            Spacer()
            Button {
                mapInput.loadTrigger.send()
                locationInput.loadTrigger.send()
            } label: {
                Image("reload")
            }
            Image("add")
                .onTapGesture {
                }
        }
    }
}

#Preview {
    let userRepository = UserRepository(api: .share)
    let userUseCase = UserUseCase(userRepository: userRepository)
    let navigator = TabbarNavigator(navigationController: UINavigationController())
    let viewModel = TabbarViewModel(userUseCase: userUseCase, navigator: navigator)
    return TabbarView(tabbarViewModel: viewModel)
}
