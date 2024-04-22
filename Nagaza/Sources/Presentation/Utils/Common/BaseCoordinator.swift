//
//  BaseCoordinator.swift
//  Nagaza
//
//  Created by 강조은 on 4/7/24.
//

import UIKit

class BaseCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController?
    weak var finishDelegate: CoordinatorFinishDelegate?
    
    init() { }
    
    /// Basic Start type
    func start(navigationController: UINavigationController) {
        self.navigationController = navigationController
        print("----- start coordinator: \(self) -----")
    }
    
    /// Login start type
    func start(
        with window: UIWindow,
        navigationController: UINavigationController
    ) {
        self.navigationController = navigationController
        print("----- start coordinator: \(self) -----")
    }
    
    /// TabBarVC start type
    func start(
        withCoordinators coordinators: [Coordinator],
        with window: UIWindow
    ) {
        print("----- start coordinator: \(self) -----")
    }
}
