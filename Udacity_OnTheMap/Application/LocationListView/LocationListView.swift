//
//  LocationListView.swift
//  Udacity_OnTheMap
//
//  Created by Work on 22/03/2024.
//

import SwiftUI

struct LocationListView: View {
    
    @ObservedObject var input: LocationListViewModel.Input
    @ObservedObject var output: LocationListViewModel.Output
    let cancelBag = CancelBag()
    
    init(viewModel: LocationListViewModel, input: LocationListViewModel.Input) {
        output = viewModel.transform(input, cancelBag: cancelBag)
        self.input = input
    }
    
    var body: some View {
        List(output.locationList, id: \.objectId) { item in
            HStack {
                Image("pin")
                VStack(alignment: .leading) {
                    HStack {
                        Text(item.firstName)
                        Text(item.lastName)
                    }
                    Text(item.mediaURL)
                        .foregroundStyle(.gray)
                }
            }
            .listRowSeparator(.visible)
        }
        .listStyle(.inset)
    }
}

#Preview {
    let useCase = LocationUseCase()
    let viewModel = LocationListViewModel(useCase: useCase)
    return LocationListView(viewModel: viewModel, input: LocationListViewModel.Input())
}
