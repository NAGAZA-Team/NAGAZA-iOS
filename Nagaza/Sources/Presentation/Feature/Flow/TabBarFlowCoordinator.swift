//
//  TabBarFlowCoordinator.swift
//  Nagaza
//
//  Created by 전성훈 on 2023/11/07.
//

import UIKit

final class TabBarFlowCoordinator: BaseCoordinator {
    private var window: UIWindow?
    private var rootViewController: UIViewController? {
        didSet {
            window?.rootViewController = rootViewController
            window?.makeKeyAndVisible()
        }
    }
    
    init(tabBarVC: UIViewController) {
        self.rootViewController = tabBarVC
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
        
        if let tabBarVC = rootViewController as? NagazaTabBarController {
            tabBarVC.setViewControllers(viewControllers, with: tabs)
            tabBarVC.selectedIndex = 0
        }
    }
}

// MARK: Logout 버튼 클릭 시 tabBar Flow Coordinator도 같이 삭제
extension TabBarFlowCoordinator: CoordinatorFinishDelegate {
    func coordinatorDidFinish(childCoordinator: Coordinator) {
        removeChildCoordinators()
        finishDelegate?.coordinatorDidFinish(childCoordinator: self)
    }
}
