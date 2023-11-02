//
//  MyPageCoordinator.swift
//  Nagaza
//
//  Created by SeungMin on 2023/11/01.
//

import UIKit

protocol MyPageCoordinatorDependencies {
    func makeMyPageViewController() -> MyPageViewController
}

final class MyPageCoordinator {
    private let navigationController: UINavigationController
    private let dependencies: MyPageCoordinatorDependencies
    
    init(navigationController: UINavigationController,
         dependencies: MyPageCoordinatorDependencies) {
        self.navigationController = navigationController
        self.dependencies = dependencies
    }
    
    func start() {
        let myPageViewController = dependencies.makeMyPageViewController()
        navigationController.pushViewController(myPageViewController,
                                                animated: true)
    }
}
