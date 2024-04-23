//
//  AppCoordinator.swift
//  Nagaza
//
//  Created by 전성훈 on 2023/10/19.
//

import UIKit

final class AppCoordinator: BaseCoordinator {

    private var splashVC: SplashViewController?
    
    init(splashVC: SplashViewController) {
        self.splashVC = splashVC
    }
    
    func start(with window: UIWindow) {
        guard let splashVC = splashVC else { return }
        
        window.rootViewController = splashVC
        window.makeKeyAndVisible()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { [weak self] in
            self?.checkAccessToken(with: window)
        }
    }
    
    private func checkAccessToken(with window: UIWindow) {
        Keychain.shared.delete(.accessToken)
        
        if let _ = Keychain.shared.get(.accessToken) {
            showTabBar(with: window)
        } else {
            showLogin(with: window)
        }
    }
    
    private func showTabBar(with window: UIWindow) {
        let diManager = DIManager.shared
        let coordinators = diManager.resolveTabBarPresentation()

        guard let tabBarCoordinator = coordinators
            .compactMap({ $0 as? TabBarCoordinator })
            .first
        else { return }
        
        addChildCoordinator(tabBarCoordinator)
        tabBarCoordinator.finishDelegate = self
        
        let subCoordinators = coordinators.filter { $0 !== tabBarCoordinator }
            
        tabBarCoordinator.start(withCoordinators: subCoordinators, with: window)
    }
    
    private func showLogin(with window: UIWindow) {
        let diManager = DIManager.shared
        let loginCoordinator = diManager.resolveLoginPresentation()

        addChildCoordinator(loginCoordinator)

        loginCoordinator.finishDelegate = self
        loginCoordinator.start(with: window, navigationController: UINavigationController())
    }
}

extension AppCoordinator: CoordinatorFinishDelegate {
    func coordinatorDidFinish(childCoordinator: Coordinator) {
        removeChildCoordinator(childCoordinator)

        if childCoordinator is TabBarCoordinator {
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
