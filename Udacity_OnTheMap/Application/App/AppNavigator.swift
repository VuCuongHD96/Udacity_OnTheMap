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
        let navigationController = UINavigationController()
//        let navigator = LoginNavigator(navigationController: navigationController)
//        let viewModel = LoginViewModel(useCase: useCase, navigator: navigator)
//        let loginView = LoginView(viewModel: viewModel)
        let view = MapListView()
        let viewController = UIHostingController(rootView: view)
        navigationController.viewControllers = [viewController]
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
