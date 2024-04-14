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
    
    func start() {
        print("----- start coordinator: \(self) -----")
    }
}
