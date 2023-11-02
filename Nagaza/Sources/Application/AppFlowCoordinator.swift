//
//  AppFlowCoordinator.swift
//  Nagaza
//
//  Created by 전성훈 on 2023/10/19.
//

import UIKit

final class AppFlowCoordinator {
    var navigationController: UINavigationController
    private let appDIContainer: AppDIContainer
    
    init(
        navigationController: UINavigationController,
        appDIContainer: AppDIContainer
    ) {
        self.navigationController = navigationController
        self.appDIContainer = appDIContainer
    }
    
    func start() {
        let splashViewController = SplashViewController()
        self.navigationController.pushViewController(splashViewController, animated: false)
        
        // TODO: 토큰 임시 설정
        Keychain.shared.set("test", forKey: .accessToken)
        
        // TODO: 토큰 삭제
//        Keychain.shared.delete(.accessToken)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            if let _ = Keychain.shared.get(.accessToken) {
                self?.showTabBar()
            } else {
                self?.showLogin()
            }
        }
    }
}

extension AppFlowCoordinator {
    func showTabBar() {
        let tabBarSceneDIContainer = appDIContainer.makeTabBarSceneDIContainer()
        let flow = tabBarSceneDIContainer.makeTabBarCoordinator()
        flow.start()
    }
    
    func showLogin() {
        let LoginDIContainer = appDIContainer.makeLoginSceneDIContainer()
        let flow = LoginDIContainer.makeTabBarFlowCoordinator()
        flow.start()
    }
}
