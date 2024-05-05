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
                .onTapGesture {
                    input.locationItemSelectedAction.send(item)
                }
            }
            .listRowSeparator(.visible)
        }
        .listStyle(.inset)
        .onAppear {
            input.loadTrigger.send()
        }
        .alert(isPresented: $output.alertMessage.isShowing, content: {
            Alert(title: Text(output.alertMessage.message))
        })
    }
}

#Preview {
    let useCase = LocationUseCase()
    let viewModel = LocationListViewModel(useCase: useCase)
    return LocationListView(viewModel: viewModel, input: LocationListViewModel.Input())
}
