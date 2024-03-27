//
//  Coordinator.swift
//  Nagaza
//
//  Created by 전성훈 on 2023/11/07.
//

import UIKit

protocol Coordinator: AnyObject {
    var type: CoordinatorType { get }

    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    var finishDelegate: CoordinatorFinishDelegate? { get set }
    var tabBarDelegate: TabBarDelegate? { get set }
    
    func start()
    func finish()
}

extension Coordinator {
    
    func finish() {
        childCoordinators.forEach { $0.navigationController.viewControllers.removeAll() }
        
        navigationController.viewControllers.removeAll()
        
        childCoordinators.removeAll()
        finishDelegate?.coordinatorDidFinish(childCoordinator: self)
    }
}

protocol CoordinatorFinishDelegate: AnyObject {
    func coordinatorDidFinish(childCoordinator: Coordinator)
}

enum CoordinatorType {
    case app, login, tab, home, map, review, myPage, myPageAppSetting
}
