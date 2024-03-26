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
        let storyBoard = UIStoryboard(name: "TabBar", bundle: nil)
        guard let tabbarScreen = storyBoard.instantiateViewController(withIdentifier: "TabBarController") as? TabBarController else {
            return
        }
        navigationController.pushViewController(tabbarScreen, animated: true)
    }
    
    func signUp() {
        guard let url = URL(string: "https://auth.udacity.com/sign-up") else {
            return
        }
        UIApplication.shared.open(url)
    }
}
