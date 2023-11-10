//
//  TabBarFlowCoordinator.swift
//  Nagaza
//
//  Created by 전성훈 on 2023/11/07.
//

import UIKit

final class TabBarFlowCoordinator: Coordinator {
    var type: CoordinatorType { .tab }
    
    var childCoordinators: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    weak var finishDelegate: CoordinatorFinishDelegate?
    weak var tabBarDelegate: TabBarDelegate? = nil
    
    private weak var tabBarVC: NagazaTabBarController!
    
    init(
        navigationController: UINavigationController,
        tabBarController: NagazaTabBarController
    ) {
        print("TabBar Flow Init")
        self.navigationController = navigationController
        self.tabBarVC = tabBarController
    }
    
    deinit {
        print("TabBar FlowDeinit")
    }
    
    func start() {
        tabBarVC.selectedIndex = 0
        
        navigationController.pushViewController(tabBarVC, animated: false)
        navigationController.setNavigationBarHidden(true, animated: false)
    }
    
    func setupTabs(with coordinators: [Coordinator]) {
        
        var tabs: [TabBarType] = []
        
        for coordinator in coordinators {
            switch coordinator.type {
            case .home:
                tabs.append(.home)
            case .map:
                tabs.append(.map)
            case .review:
                tabs.append(.review)
            case .myPage:
                tabs.append(.myPage)
            default:
                continue
            }
            
            coordinator.finishDelegate = self
            coordinator.tabBarDelegate = tabBarVC
            
            coordinator.start()

            childCoordinators.append(coordinator)
        }
        
        let viewControllers = coordinators.map { $0.navigationController }

        tabBarVC.setViewControllers(viewControllers, with: tabs)
    }
}

// MARK: Logout 버튼 클릭 시 tabBar Flow Coordinator도 같이 삭제
extension TabBarFlowCoordinator: CoordinatorFinishDelegate {
    func coordinatorDidFinish(childCoordinator: Coordinator) {
        self.finish()
    }
}
