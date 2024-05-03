//
//  AddLocationView.swift
//  Udacity_OnTheMap
//
//  Created by Work on 2/5/24.
//

import SwiftUI
import MapKit

struct AddLocationView: View {
    
    let input: AddLocationViewModel.Input
    let output: AddLocationViewModel.Output
    let cancelBag = CancelBag()
    
    init(viewModel: AddLocationViewModel) {
        let input = AddLocationViewModel.Input()
        output = viewModel.transform(input, cancelBag: cancelBag)
        self.input = input
    }
    
    var body: some View {
        UdacityNavigationView {
            HStack {
                Button(action: {
                    input.backAction.send()
                }, label: {
                    Image("undo")
                })
                Spacer()
                Text("Add Location")
                    .fontWeight(.bold)
                Spacer()
                Rectangle()
                    .fill(.white)
                    .frame(width: 30, height: 30)
            }
            .padding(.horizontal)
        } bodyContent: {
            MapViewRepresent(openLinkTrigger: .constant(""), locationViewItemList: [output.locationFound])
                .overlay(alignment: .bottom) {
                    addButton
                }
                .padding(.top)
        }
        .ignoresSafeArea(edges: .bottom)
    }
    
    private var addButton: some View {
        Button {
            input.addLocationAction.send()
        } label: {
            Text("ADD LOCATION")
                .fontWeight(.medium)
                .frame(maxWidth: .infinity, minHeight: 40)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
                .overlay {
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray, lineWidth: 1)
                }
        }
        .padding()
    }
}

#Preview {
    let navigationController = UINavigationController()
    let navigator = AddLocationNavigator(navigationController: navigationController)
    let locationViewItem = LocationViewItem(name: "", coordinate: .init())
    let viewModel = AddLocationViewModel(locationFound: locationViewItem, navigator: navigator)
    return AddLocationView(viewModel: viewModel)
}
