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
    @ObservedObject var output: LoginViewModel.Output
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
                input.loginAction.send()
            }, label: {
                Text("LOGIN")
                    .foregroundColor(.white)
                    .fontWeight(.medium)
                    .frame(maxWidth: .infinity, maxHeight: 50)
                    .background(output.loginIsValid ? Color.blue : Color.red)
                    .cornerRadius(8)
            })
            .allowsHitTesting(output.loginIsValid)
            Text("Don't have an account?")
            Button("Sign up") {
                input.signUpAction.send()
            }
        }
        .alert(isPresented: $output.alertMessage.isShowing, content: {
            Alert(title: Text(output.alertMessage.message))
        })
        .padding()
        .padding(.bottom, 100)
    }
}

#Preview {
    let repository = UserRepository(api: .share)
    let useCase = UserUseCase(userRepository: repository)
    let navigationController = UINavigationController()
    let navigator = LoginNavigator(navigationController: navigationController)
    let viewModel = LoginViewModel(useCase: useCase, navigator: navigator)
    return LoginView(viewModel: viewModel)
}
