//
//  MapView.swift
//  Udacity_OnTheMap
//
//  Created by Work on 13/4/24.
//

import SwiftUI

struct MapView: View {
    
    @ObservedObject var input: MapViewModel.Input
    @ObservedObject var output: MapViewModel.Output
    let cancelBag = CancelBag()
    
    init(viewModel: MapViewModel, input: MapViewModel.Input) {
        self.output = viewModel.transform(input, cancelBag: cancelBag)
        self.input = input
    }
    
    var body: some View {
        MapViewRepresent(openLinkTrigger: $input.openLinkTrigger,
                         locationViewItemList: output.locationViewItemList)
        .alert(isPresented: $output.alertMessage.isShowing, content: {
            Alert(title: Text(output.alertMessage.title),
                  message: Text(output.alertMessage.message))
        })
        .onAppear {
            input.loadTrigger.send()
        }
    }
}

#Preview {
    let useCase = LocationUseCase()
    let viewModel = MapViewModel(useCase: useCase)
    return MapView(viewModel: viewModel, input: MapViewModel.Input())
}
