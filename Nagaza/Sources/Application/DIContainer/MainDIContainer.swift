//
//  MainDIContainer.swift
//  Nagaza
//
//  Created by SeungMin on 2023/11/01.
//

import UIKit

final class MainDIContainer {
    func makeMainCoordinator(navigationController: UINavigationController) -> MainCoordinator {
        return MainCoordinator(
            navigationController: navigationController,
            dependencies: self
        )
    }
}

extension MainDIContainer: MainCoordinatorDependencies {
    func makeMainViewController() -> MainViewController {
        return MainViewController()
    }
}
