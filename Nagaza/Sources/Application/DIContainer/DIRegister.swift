//
//  DIRegister.swift
//  Nagaza
//
//  Created by 전성훈 on 4/9/24.
//

import Foundation

final class DIRegister {
    static let shared = DIRegister()
    let container = DIContainer.shared
    
    private init() { }
    
    func registerDIContainer() {
        
        container.register(HomeRepositoryInterface.self, dependency: HomeRepository())
        container.register(DefaultHomeUseCase.self, dependency: DefaultHomeUseCase(roomsRepository: container.resolve(HomeRepository.self)))
        container.register(DefaultRegionSettingUseCase.self, dependency: DefaultRegionSettingUseCase())
        
        container.register(SplashViewController.self,dependency: SplashViewController())
        container.register(AppFlowCoordinator.self,dependency: AppFlowCoordinator())
        
        container.register(TabBarFlowCoordinator.self,dependency: TabBarFlowCoordinator())
        container.register(NagazaTabBarController.self,dependency: NagazaTabBarController())
        
        container.register(LoginFlowCoordinator.self, dependency: LoginFlowCoordinator())
        
        container.register(HomeFlowCoordinator.self, dependency: HomeFlowCoordinator())
        
        container.register(MapFlowCoordinator.self, dependency: MapFlowCoordinator())
        
        container.register(ReviewFlowCoordinator.self, dependency: ReviewFlowCoordinator())
        
        container.register(MyPageFlowCoordinator.self, dependency: MyPageFlowCoordinator())
        
    }
}
