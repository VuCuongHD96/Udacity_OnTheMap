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
}

struct LoginNavigator: LoginNavigatorType {
    
    let navigationController: UINavigationController
    
    func toTabbar() {
        let storyBoard = UIStoryboard(name: "TabBar", bundle: nil)
        guard let tabbarScreen = storyBoard.instantiateViewController(withIdentifier: "TabBarController") as? TabBarController else {
            return
        }
        navigationController.pushViewController(tabbarScreen, animated: true)
    }
}
