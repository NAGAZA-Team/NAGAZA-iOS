//
//  AppCoordinator.swift
//  Nagaza
//
//  Created by 전성훈 on 2023/10/19.
//

import UIKit

final class AppFlowCoordinator: BaseCoordinator {
    func startRoot(with window: UIWindow) {
        if let _ = Keychain.shared.get(.accessToken) {
            showTabBar(with: window)
        } else {
            showLogin(with: window)
        }
    }
    
    private func showTabBar(with window: UIWindow) {
        let container = DIContainer.shared
        
        if let tabBarCoordinator = container.resolve(TabBarFlowCoordinator.self),
           let homeFlowCoordinator = container.resolve(HomeFlowCoordinator.self),
           let mapFlowCoordinator = container.resolve(MapFlowCoordinator.self),
           let reviewFlowCoordinator = container.resolve(ReviewFlowCoordinator.self),
           let myPageFlowCoordinator = container.resolve(MyPageFlowCoordinator.self) {
            
            addChildCoordinator(tabBarCoordinator)
            
            let coordinators = [
                homeFlowCoordinator,
                mapFlowCoordinator,
                reviewFlowCoordinator,
                myPageFlowCoordinator
            ]
            
            tabBarCoordinator.start(
                withViewControllers: coordinators,
                with: window
            )
        }
    }
    
    private func showLogin(with window: UIWindow) {
        let loginSceneDIContainer = appDIContainer.makeLoginSceneDIContainer()
        let loginFlow = loginSceneDIContainer.makeLoginFlowCoordinator(
            navigationController: navigationController
        )
        
        loginFlow.start()
        
        childCoordinators.append(loginFlow)
    }
}

extension AppFlowCoordinator {
}

extension AppFlowCoordinator: CoordinatorFinishDelegate {
    func coordinatorDidFinish(childCoordinator: Coordinator) {
        if childCoordinator is TabBarFlowCoordinator {
            navigationController.viewControllers.removeAll()
            
            // TODO: 토큰 삭제
            Keychain.shared.delete(.accessToken)
            
            showLogin()
        } else {
            navigationController.viewControllers.removeAll()
            
            // TODO: 토큰 임시 설정
            Keychain.shared.set("test", forKey: .accessToken)
            
            showTabBar()
        }
    }
}
