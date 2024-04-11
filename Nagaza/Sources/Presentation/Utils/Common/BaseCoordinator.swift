//
//  BaseCoordinator.swift
//  Nagaza
//
//  Created by 강조은 on 4/7/24.
//

import UIKit

class BaseCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    var viewController: UIViewController = UIViewController()
    weak var finishDelegate: CoordinatorFinishDelegate?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func addChildCooridnator(_ coordinator: Coordinator) {
        for element in childCoordinators {
            if element === coordinator { return }
        }
        childCoordinators.append(coordinator)
    }
    
    func removeChildCoordinator(_ coordinator: Coordinator) {
        for (index, element) in childCoordinators.enumerated() {
            if element === coordinator {
                childCoordinators.remove(at: index)
                break
            }
        }
    }
    
    func start() {}
}
