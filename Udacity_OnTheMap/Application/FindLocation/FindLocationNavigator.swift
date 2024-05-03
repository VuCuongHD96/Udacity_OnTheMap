//
//  FindLocationNavigator.swift
//  Udacity_OnTheMap
//
//  Created by Work on 25/4/24.
//

import Foundation
import UIKit
import SwiftUI

protocol FindLocationNavigatorType {
    
    func goBack()
    func goToAddLocationScreen(locationViewItem: LocationViewItem)
}

struct FindLocationNavigator {
    
    let navigationController: UINavigationController
}

extension FindLocationNavigator: FindLocationNavigatorType {
    
    func goBack() {
        navigationController.popViewController(animated: true)
    }
    
    func goToAddLocationScreen(locationViewItem: LocationViewItem) {
        let navigator = AddLocationNavigator(navigationController: navigationController)
        let viewModel = AddLocationViewModel(locationFound: locationViewItem, navigator: navigator)
        let addLocationView = AddLocationView(viewModel: viewModel)
        let addLocationScreen = UIHostingController(rootView: addLocationView)
        navigationController.pushViewController(addLocationScreen, animated: true)
    }
}
