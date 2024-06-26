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
            TextField("Email", text: $input.emailValue)
                .modifier(LoginTextFieldModifier())
            SecureField("Password", text: $input.passwordValue)
                .modifier(LoginTextFieldModifier())
            Button(action: {
                input.loginAction.send()
            }, label: {
                Text("LOGIN")
                    .foregroundColor(.white)
                    .fontWeight(.medium)
                    .frame(maxWidth: .infinity, minHeight: 50)
                    .background(output.loginIsValid ? Color.blue : Color.red)
                    .cornerRadius(8)
            })
            .allowsHitTesting(output.loginIsValid)
            Text("Don't have an account?")
            Button("Sign up") {
                input.signUpAction.send()
            }
        }
        .padding()
        .padding(.bottom, 100)
        .alert(isPresented: $output.alertMessage.isShowing, content: {
            Alert(title: Text(output.alertMessage.title),
                  message: Text(output.alertMessage.message))
        })
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
