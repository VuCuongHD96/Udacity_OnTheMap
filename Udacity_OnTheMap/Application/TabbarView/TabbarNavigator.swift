//
//  TabbarNavigator.swift
//  Udacity_OnTheMap
//
//  Created by Work on 21/4/24.
//

import UIKit

protocol TabbarNavigatorType {
    func goBack()
}

struct TabbarNavigator: TabbarNavigatorType {
    
    let navigationController: UINavigationController
    
    func goBack() {
        navigationController.popViewController(animated: true)
    }
}
