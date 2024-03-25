//
//  TabBarController.swift
//  MovieSwiftUI
//
//  Created by Work on 02/05/2023.
//

import UIKit
import SwiftUI

class TabBarController: UITabBarController {
    
    // MARK: - Property
    var viewModel: TabbarViewModel! {
        didSet {
            viewModel.dataDidChange = { [unowned self] _ in
                bindViewModel()
            }
        }
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupNavigation()
    }

    // MARK: - View
    private func setupView() {
        tabBar.tintColor = UIColor.systemPink
        guard let navigationController = navigationController else {
            return
        }
        let navigator = TabbarNavigator(navigationController: navigationController)
        viewModel = TabbarViewModel(navigator: navigator)
        viewModel.showScreen()
    }
    
    private func setupNavigation() {
        title = "On The Map"
        let logoutBarButtonItem = UIBarButtonItem(image: UIImage(named: "logout"),
                                                  style: .plain,
                                                  target: self,
                                                  action: #selector(logoutAction))
        navigationItem.leftBarButtonItem = logoutBarButtonItem
        let reloadBarButtonItem = UIBarButtonItem(image: UIImage(named: "reload"),
                                                  style: .plain,
                                                  target: self,
                                                  action: #selector(reloadAction))
        let addBarButtonItem = UIBarButtonItem(image: UIImage(named: "add"),
                                                  style: .plain,
                                                  target: self,
                                                  action: #selector(addAction))
        navigationItem.rightBarButtonItems = [addBarButtonItem, reloadBarButtonItem]
        
    }
    
    @objc private func logoutAction() {
        
    }
    
    @objc private func addAction() {
        
    }
    
    @objc private func reloadAction() {
        
    }
    
    // MARK: - Bind Data
    private func bindViewModel() {
        viewControllers = viewModel.viewControllers
    }
}
