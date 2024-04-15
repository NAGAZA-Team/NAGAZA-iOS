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
    weak var finishDelegate: CoordinatorFinishDelegate?
    
    init() { }
    
    func start(navigationController: UINavigationController) {
        self.navigationController = navigationController
        print("----- start coordinator: \(self) -----")
    }
}
