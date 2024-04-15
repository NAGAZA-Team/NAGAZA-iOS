//
//  DIRegister.swift
//  Nagaza
//
//  Created by 전성훈 on 4/9/24.
//

import Foundation

final class DIRegister {
    static let shared = DIRegister()
    
    private init() { }
    
    func registerDIContainer() {
        let container = DIContainer.shared
        
        container.register(
            SplashViewController.self,
            dependency: SplashViewController()
        )
        container.register(
            AppFlowCoordinator.self,
            dependency: AppFlowCoordinator()
        )
        
        container.register(
            TabBarFlowCoordinator.self,
            dependency: TabBarFlowCoordinator()
        )
        
        container.register(LoginCoordinator.self, dependency: LoginCoordinator())
        container.register(HomeFlowCoordinator.self, dependency: HomeFlowCoordinator())
        container.register(MapFlowCoordinator.self, dependency: MapFlowCoordinator())
        container.register(ReviewFlowCoordinator.self, dependency: ReviewFlowCoordinator())
        container.register(MyPageFlowCoordinator.self, dependency: MyPageFlowCoordinator())
        
        container.register(
            NagazaTabBarController.self,
            dependency: NagazaTabBarController()
        )
    }
}
