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
    
    private var tabBarController: NagazaTabBarController
    
    init(
        navigationController: UINavigationController,
        tabBarController: NagazaTabBarController
    ) {
        print("TabBar Flow Init")
        self.navigationController = navigationController
        self.tabBarController = tabBarController
    }
    
    deinit {
        print("TabBar FlowDeinit")
    }
    
    func start() {
        tabBarController.selectedIndex = 0
    }
    
    func setupTabs(with coordinators: [Coordinator]) {
        navigationController.pushViewController(tabBarController, animated: false)
        navigationController.setNavigationBarHidden(true, animated: false)
        
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
            coordinator.tabBarDelegate = tabBarController
            
            coordinator.start()

            childCoordinators.append(coordinator)
        }
        
        let viewControllers = coordinators.map { $0.navigationController }

        tabBarController.setViewControllers(viewControllers, with: tabs)
    }
}

// MARK: Logout 버튼 클릭 시 tabBar Flow Coordinator도 같이 삭제
extension TabBarFlowCoordinator: CoordinatorFinishDelegate {
    func coordinatorDidFinish(childCoordinator: Coordinator) {
        childCoordinators = childCoordinators.filter({ $0.type != childCoordinator.type })

        switch childCoordinator.type {
        case .home:
            self.finish()
        default:
            break
        }
    }
}
