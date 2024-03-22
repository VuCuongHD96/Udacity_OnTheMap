//
//  AppNavigator.swift
//  Udacity_OnTheMap
//
//  Created by Work on 21/03/2024.
//

import UIKit
import SwiftUI

protocol AppNavigatorType {
    func toMainView()
}

struct AppNavigator: AppNavigatorType {
    
    unowned let window: UIWindow!
    
    func toMainView() {
        let repository = UserRepository(api: .share)
        let useCase = UserUseCase(userRepository: repository)
        let viewModel = LoginViewModel(useCase: useCase)
        let loginView = LoginView(viewModel: viewModel)
        let viewController = UIHostingController(rootView: loginView)
        let navigationController = UINavigationController(rootViewController: viewController)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
