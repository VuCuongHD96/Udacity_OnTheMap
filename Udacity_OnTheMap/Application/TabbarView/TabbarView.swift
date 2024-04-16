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
    
    private let mapViewModel = MapViewModel(useCase: LocationUseCase())
    private let locationListViewModel = LocationListViewModel(useCase: LocationUseCase())
    private let cancelBag = CancelBag()
    
    init() {
        self.mapInput = MapViewModel.Input()
        self.locationInput = LocationListViewModel.Input()
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
            Image("logout")
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
    TabbarView()
}
