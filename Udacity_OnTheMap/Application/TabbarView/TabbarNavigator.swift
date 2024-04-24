//
//  TabbarNavigator.swift
//  Udacity_OnTheMap
//
//  Created by Work on 21/4/24.
//

import UIKit
import SwiftUI

protocol TabbarNavigatorType {
    func goBack()
    func toAddScreen()
}

struct TabbarNavigator: TabbarNavigatorType {
    
    let navigationController: UINavigationController
    
    func goBack() {
        navigationController.popViewController(animated: true)
    }
    
    func toAddScreen() {
        let addView = AddLocationView()
        let addScreen = UIHostingController(rootView: addView)
        navigationController.pushViewController(addScreen, animated: true)
    }
}
