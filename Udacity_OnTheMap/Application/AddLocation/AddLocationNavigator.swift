//
//  AddLocationNavigator.swift
//  Udacity_OnTheMap
//
//  Created by Work on 3/5/24.
//

import UIKit
import SwiftUI

protocol AddLocationNavigatorType {
    func goBack()
    func popToTabbar()
}

struct AddLocationNavigator: AddLocationNavigatorType {
    
    let navigationController: UINavigationController
    
    func goBack() {
        navigationController.popViewController(animated: true)
    }
    
    func popToTabbar() {
        if let viewController = navigationController.viewControllers.first(where: { $0 is UIHostingController<TabbarView> }) {
            navigationController.popToViewController(viewController, animated: true)
        }
    }
}
