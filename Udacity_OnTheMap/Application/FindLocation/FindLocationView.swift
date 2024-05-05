//
//  FindLocationView.swift
//  Udacity_OnTheMap
//
//  Created by Work on 24/4/24.
//

import SwiftUI

private struct LocationTextFieldModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .frame(height: 40)
            .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
            .overlay {
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.gray, lineWidth: 1)
            }
    }
}

struct FindLocationView: View {
    
    @ObservedObject var input: FindLocationViewModel.Input
    @ObservedObject var output: FindLocationViewModel.Output
    private let cancelBag = CancelBag()
    
    init(viewModel: FindLocationViewModel) {
        let input = FindLocationViewModel.Input()
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
                Text("Find Location")
                    .fontWeight(.bold)
                Spacer()
                Rectangle()
                    .fill(.white)
                    .frame(width: 30, height: 30)
            }
            .padding(.horizontal)
        } bodyContent: {
            VStack(spacing: 30) {
                Image("icon_world")
                VStack(spacing: 15) {
                    TextField("Enter a Location", text: $input.locationString)
                        .modifier(LocationTextFieldModifier())
                    TextField("Enter a Website", text: $input.websiteString)
                        .modifier(LocationTextFieldModifier())
                    if !output.isWebsiteValid {
                        Text("This url not contains http://")
                            .fontWeight(.medium)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundColor(.red)
                    }
                    if output.isLoading {
                        ProgressView()
                    }
                    findButton
                }
            }
            .padding()
            .padding(.top, 150)
            Spacer()
        }
        .alert(isPresented: $output.alertMessage.isShowing, content: {
            Alert(title: Text(output.alertMessage.title), message: Text(output.alertMessage.message))
        })
    }
    
    private var findButton: some View {
        Button {
            input.findLocationAction.send()
        } label: {
            Text("FIND LOCATION")
                .frame(maxWidth: .infinity, minHeight: 40)
                .background(output.findButtonStatus ? Color.blue.opacity(0.8) : Color.gray)
                .foregroundColor(.white)
                .cornerRadius(8)
                .overlay {
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray, lineWidth: 1)
                }
        }
        .allowsHitTesting(output.findButtonStatus)
        .animation(.easeInOut, value: output.findButtonStatus)
    }
}

#Preview {
    let navigationController = UINavigationController()
    let navigator = FindLocationNavigator(navigationController: navigationController)
    let viewModel = FindLocationViewModel(navigator: navigator)
    return FindLocationView(viewModel: viewModel)
}
