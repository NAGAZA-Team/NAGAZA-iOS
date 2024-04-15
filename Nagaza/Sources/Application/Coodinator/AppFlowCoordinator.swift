//
//  AppCoordinator.swift
//  Nagaza
//
//  Created by 전성훈 on 2023/10/19.
//

import UIKit

final class AppFlowCoordinator: BaseCoordinator {
    let container = DIContainer.shared

    func start(with window: UIWindow) {
        window.rootViewController = container.resolve(SplashViewController.self)
        window.makeKeyAndVisible()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { [weak self] in
            self?.checkAccessToken(with: window)
        }
    }
    
    private func checkAccessToken(with window: UIWindow) {
        if let _ = Keychain.shared.get(.accessToken) {
            showTabBar(with: window)
        } else {
            showLogin(with: window)
        }
    }
    
    private func showTabBar(with window: UIWindow) {
        let tabBarCoordinator = container.resolve(TabBarFlowCoordinator.self)
        let homeFlowCoordinator = container.resolve(HomeFlowCoordinator.self)
        let mapFlowCoordinator = container.resolve(MapFlowCoordinator.self)
        let reviewFlowCoordinator = container.resolve(ReviewFlowCoordinator.self)
        let myPageFlowCoordinator = container.resolve(MyPageFlowCoordinator.self)
        
        addChildCoordinator(tabBarCoordinator)
        
        let coordinators = [
            homeFlowCoordinator,
            mapFlowCoordinator,
            reviewFlowCoordinator,
            myPageFlowCoordinator
        ]
        
        tabBarCoordinator.finishDelegate = self
        tabBarCoordinator.start(
            withViewControllers: coordinators,
            with: window
        )
        
    }
    
    private func showLogin(with window: UIWindow) {
        
        let loginFlowCoordinator = container.resolve(LoginFlowCoordinator.self)

        addChildCoordinator(loginFlowCoordinator)

        loginFlowCoordinator.finishDelegate = self
        loginFlowCoordinator.start(with: window, navigationController: UINavigationController())
    }
}

extension AppFlowCoordinator: CoordinatorFinishDelegate {
    func coordinatorDidFinish(childCoordinator: Coordinator) {
        removeChildCoordinator(childCoordinator)

        if childCoordinator is TabBarFlowCoordinator {
            // TODO: 토큰 삭제
            Keychain.shared.delete(.accessToken)
            
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
               let window = windowScene.windows.first {
                showLogin(with: window)
            }
        } else {
            // TODO: 토큰 임시 설정
            Keychain.shared.set("test", forKey: .accessToken)
            
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
               let window = windowScene.windows.first {
                showTabBar(with: window)
            }
        }
    }
}
