//
//  TabbarNavigator.swift
//  MovieSwiftUI
//
//  Created by Work on 02/05/2023.
//

import SwiftUI

protocol TabbarNavigatorType {
    func createLocationListScreen() -> UIViewController
    func createMapScreen() -> UIViewController
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
    
    private func createMapTabbarItem() -> UITabBarItem {
        let mapImage = UIImage(named: "map")?.withRenderingMode(.alwaysOriginal)
        let mapSelectedImage = UIImage(named: "map")?.withRenderingMode(.alwaysOriginal)
        let tabbarItem = UITabBarItem(title: nil, image: mapImage, selectedImage: mapSelectedImage)
        return tabbarItem
    }
    
    func createMapScreen() -> UIViewController {
        let mapView = MapView()
        let mapViewController = UIHostingController(rootView: mapView)
        mapViewController.tabBarItem = createMapTabbarItem()
        return mapViewController
    }
    
    func popBack() {
        navigationController.popViewController(animated: true)
    }
}
