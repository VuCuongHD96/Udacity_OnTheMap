//
//  LoginNavigator.swift
//  Udacity_OnTheMap
//
//  Created by Work on 22/03/2024.
//

import Foundation
import SwiftUI

protocol LoginNavigatorType {
    
    func toTabbar()
    func signUp()
}

struct LoginNavigator: LoginNavigatorType {
    
    let navigationController: UINavigationController
    
    func toTabbar() {
        let userRepository = UserRepository(api: .share)
        let userUseCase = UserUseCase(userRepository: userRepository)
        let navigator = TabbarNavigator(navigationController: navigationController)
        let viewModel = TabbarViewModel(userUseCase: userUseCase, navigator: navigator)
        let tabbarView = TabbarView(tabbarViewModel: viewModel)
        let tabbarScreen = UIHostingController(rootView: tabbarView)
        navigationController.navigationBar.isHidden = true
        navigationController.pushViewController(tabbarScreen, animated: true)
    }
    
    func signUp() {
        guard let url = URL(string: "https://auth.udacity.com/sign-up") else {
            return
        }
        UIApplication.shared.open(url)
    }
}
