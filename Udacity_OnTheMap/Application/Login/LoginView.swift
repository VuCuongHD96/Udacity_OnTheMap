//
//  LoginView.swift
//  Udacity_OnTheMap
//
//  Created by Work on 21/03/2024.
//

import SwiftUI

enum FocusField {
    case email
    case password
}

struct LoginView: View {
    
   @ObservedObject var input: LoginViewModel.Input
    let output: LoginViewModel.Output
    let cancelBag = CancelBag()
    
    init(viewModel: LoginViewModel) {
        let input = LoginViewModel.Input()
        output = viewModel.transform(input, cancelBag: cancelBag)
        self.input = input
    }
    
    @FocusState private var focusField: FocusField?
    
    var body: some View {
        VStack(spacing: 20) {
            Image("udacity_icon")
            EmailTextField(emailValue: $input.emailValue)
            PasswordTextField(passwordValue: $input.passwordValue)
            Button(action: {
                print("Login")
            }, label: {
                Text("LOGIN")
                    .foregroundColor(.white)
                    .fontWeight(.medium)
                    .frame(maxWidth: .infinity, maxHeight: 50)
                    .background(Color.blue)
                    .cornerRadius(8)
            })
            Text("Don't have an account?")
            Button("Sign up") {
                
            }
        }
        .padding()
        .padding(.bottom, 100)
    }
}

#Preview {
    LoginView(viewModel: LoginViewModel())
}
