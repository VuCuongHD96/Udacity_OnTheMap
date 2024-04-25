//
//  AddLocationNavigator.swift
//  Udacity_OnTheMap
//
//  Created by Work on 25/4/24.
//

import Foundation
import UIKit

protocol AddLocationNavigatorType {
    
    func goBack()
}

struct AddLocationNavigator {
    
    let navigationController: UINavigationController
}

extension AddLocationNavigator: AddLocationNavigatorType {
    
    func goBack() {
        navigationController.popViewController(animated: true)
    }
}
