//
//  TabbarViewModel.swift
//  MovieSwiftUI
//
//  Created by Work on 02/05/2023.
//

import UIKit

protocol TabbarViewModelType {
    
    // MARK: - Define
    typealias Listener = (TabbarViewModelType) -> Void
    
    // MARK: - Property
    var dataDidChange: Listener? { get set }
    var viewControllers: [UIViewController] { get }
    func showScreen()
    func logoutAction()
}

final class TabbarViewModel {
    
    let navigator: TabbarNavigatorType
    let userUseCase: UserUseCaseType
    let cancelBag: CancelBag
    
    var dataDidChange: Listener?
    var viewControllers = [UIViewController]() {
        didSet {
            dataDidChange?(self)
        }
    }
    
    init(navigator: TabbarNavigatorType, userUseCase: UserUseCaseType, cancelBag: CancelBag) {
        self.navigator = navigator
        self.userUseCase = userUseCase
        self.cancelBag = cancelBag
    }
}

extension TabbarViewModel: TabbarViewModelType {
    
    func showScreen() {
        let locationListScreen = navigator.createLocationListScreen()
        let mapScreen = navigator.createMapScreen()
        viewControllers = [mapScreen, locationListScreen]
    }
    
    func logoutAction() {
        userUseCase.logout()
            .sink(receiveCompletion: { completion in
                if case let .failure(error) = completion {
                    print("--- debug --- error = ", error)
                }
            }, receiveValue: { _ in
                self.navigator.popBack()
            })
            .store(in: cancelBag)
    }
}
