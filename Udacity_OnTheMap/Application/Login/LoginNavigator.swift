//
//  LoginNavigator.swift
//  Udacity_OnTheMap
//
//  Created by Work on 22/03/2024.
//

import Foundation
import SwiftUI

protocol LoginNavigatorType {
    func toMapListScreen()
}

struct LoginNavigator: LoginNavigatorType {
    
    let navigationController: UINavigationController
    
    func toMapListScreen() {
        let mapListView = MapListView()
        let mapListScreen = UIHostingController(rootView: mapListView)
        navigationController.pushViewController(mapListScreen, animated: true)
    }
}
