//
//  TabBarFlowCoordinator.swift
//  Nagaza
//
//  Created by 전성훈 on 2023/11/07.
//

import UIKit

final class TabBarFlowCoordinator: BaseCoordinator {
    
    override init(
        navigationController: UINavigationController
    ) {
        super.init(navigationController: navigationController)
    }
    
    func start(with coordinators: [Coordinator]) {
        
        let tabBarVC = NagazaTabBarController()
        viewController = tabBarVC
        
        setupTabs(with: coordinators)
        
        navigationController.setNavigationBarHidden(true, animated: false)
        navigationController.pushViewController(tabBarVC, animated: false)
    }
    
    func setupTabs(with coordinators: [Coordinator]) {
        let tabs: [TabBarType] = TabBarType.allCases
        
        for coordinator in coordinators {
            coordinator.start()
            childCoordinators.append(coordinator)
        }
        
        let viewControllers = coordinators.map { $0.navigationController }
        
        if let tabBarVC = viewController as? NagazaTabBarController {
            tabBarVC.setViewControllers(viewControllers, with: tabs)
            tabBarVC.selectedIndex = 0
        }
    }
}

// MARK: Logout 버튼 클릭 시 tabBar Flow Coordinator도 같이 삭제
extension TabBarFlowCoordinator: CoordinatorFinishDelegate {
    func coordinatorDidFinish(childCoordinator: Coordinator) {
        navigationController.popViewController(animated: true)
        removeChildCoordinator(childCoordinator)
    }
}
