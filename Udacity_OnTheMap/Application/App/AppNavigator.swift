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
        let navigationController = UINavigationController()
        let viewModel = LoginViewModel()
        let loginView = LoginView(viewModel: viewModel)
        let viewController = UIHostingController(rootView: loginView)
        navigationController.viewControllers = [viewController]
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
