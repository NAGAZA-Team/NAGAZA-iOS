//
//  MyPageDIContainer.swift
//  Nagaza
//
//  Created by SeungMin on 2023/11/01.
//

import UIKit

final class MyPageDIContainer {
    func makeMyPageCoordinator(navigationController: UINavigationController) -> MyPageCoordinator {
        return MyPageCoordinator(
            navigationController: navigationController,
            dependencies: self
        )
    }
}

extension MyPageDIContainer: MyPageCoordinatorDependencies {
    func makeMyPageViewController() -> MyPageViewController {
        return MyPageViewController()
    }
}
