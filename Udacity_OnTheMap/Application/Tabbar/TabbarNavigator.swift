//
//  TabbarNavigator.swift
//  MovieSwiftUI
//
//  Created by Work on 02/05/2023.
//

import SwiftUI

protocol TabbarNavigatorType {
    func createLocationListScreen() -> UIViewController
    func popBack()
}

struct TabbarNavigator: TabbarNavigatorType {
    
    let navigationController: UINavigationController
    
    private func createLocationListTabbarItem() -> UITabBarItem {
        let locationImage = UIImage(named: "location")?.withRenderingMode(.alwaysOriginal)
        let locationSelectedImage = UIImage(named: "location")?.withRenderingMode(.alwaysOriginal)
        let tabbarItem = UITabBarItem(title: nil, image: locationImage, selectedImage: locationSelectedImage)
        return tabbarItem
    }
    
    func createLocationListScreen() -> UIViewController {
        let useCase = LocationListUseCase()
        let viewModel = LocationListViewModel(useCase: useCase)
        let locationListView = LocationListView(viewModel: viewModel)
        let locationListViewController = UIHostingController(rootView: locationListView)
        locationListViewController.tabBarItem = createLocationListTabbarItem()
        return locationListViewController
    }
    
    func popBack() {
        navigationController.popViewController(animated: true)
    }
}
