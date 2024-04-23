//
//  TabBarFlowCoordinator.swift
//  Nagaza
//
//  Created by 전성훈 on 2023/11/07.
//

import UIKit

final class TabBarCoordinator: BaseCoordinator {
    private var window: UIWindow?
    private var tabBarVC: UIViewController
    
    init(tabBarVC: UIViewController) {
        self.tabBarVC = tabBarVC
    }
    
    override func start(withCoordinators coordinators: [Coordinator],
               with window: UIWindow
    ) {
        self.window = window
        setupTabs(withViewControllers: coordinators)
    }
    
    private func setupTabs(withViewControllers coordinators: [Coordinator]) {
        let tabs: [TabBarType] = TabBarType.allCases
                
        for coordinator in coordinators {
            addChildCoordinator(coordinator)
            coordinator.start(navigationController: UINavigationController())
        }
        
        let viewControllers = coordinators.compactMap { $0.navigationController }
        
        if let tabBarVC = tabBarVC as? NagazaTabBarController {
            tabBarVC.setViewControllers(viewControllers, with: tabs)
            tabBarVC.selectedIndex = 0
        }
        
        self.window?.rootViewController = tabBarVC
        self.window?.makeKeyAndVisible()
    }
}

// MARK: Logout 버튼 클릭 시 tabBar Flow Coordinator도 같이 삭제
extension TabBarCoordinator: CoordinatorFinishDelegate {
    func coordinatorDidFinish(childCoordinator: Coordinator) {
        removeChildCoordinators()
        DIManager.shared.unregisterTabBarPresentation()
        
        finishDelegate?.coordinatorDidFinish(childCoordinator: self)
    }
}
