//
//  MainCoordinator.swift
//  Nagaza
//
//  Created by SeungMin on 2023/11/01.
//

import UIKit

protocol MainCoordinatorDependencies {
    func makeMainViewController() -> MainViewController
}

final class MainCoordinator {
    private let navigationController: UINavigationController
    private let dependencies: MainCoordinatorDependencies
    
    init(navigationController: UINavigationController,
         dependencies: MainCoordinatorDependencies) {
        self.navigationController = navigationController
        self.dependencies = dependencies
    }
    
    func start() {
        let mainViewController = dependencies.makeMainViewController()
        navigationController.pushViewController(mainViewController,
                                                animated: true)
    }
}
