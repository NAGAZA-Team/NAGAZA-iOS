//
//  DIProvider.swift
//  Nagaza
//
//  Created by 전성훈 on 4/22/24.
//

import Foundation

final class DIManager {
    static let shared = DIManager()

    let container = DIContainer.sharedContainer()
    let register = DIRegister.shared

    private init() { }
    
    /// 공통 메서드
    private func resolveCoordinator<T: BaseCoordinator>(
        type: T.Type,
        registerAction: () -> Void
    ) -> T {
        if let coordinator = container.resolve(type) {
            return coordinator
        } else {
            registerAction()
            guard let reResolvedCoordinator = container.resolve(type) else {
                fatalError("\(type) 재등록 실패")
            }
            
            return reResolvedCoordinator
        }
    }
    
    func resolveTabBarPresentation() -> [BaseCoordinator] {
        let coordinatorTypes: [BaseCoordinator.Type] = [
                 TabBarCoordinator.self,
                 HomeCoordinator.self,
                 MapCoordinator.self,
                 ReviewCoordinator.self,
                 MyPageCoordinator.self
             ]
                
        return coordinatorTypes.compactMap { type in
            resolveCoordinator(
                type: type,
                registerAction: register.registerTabBarsPresentation
            )
        }
    }
    
    func unregisterTabBarPresentation() {
        let viewModelTypes: [AnyObject.Type] = [
            HomeViewModel.self,
            MapViewModel.self,
            ReviewViewModel.self,
            MyPageViewModel.self
        ]
        
        let viewControllerTypes: [AnyObject.Type] = [
            NagazaTabBarController.self,
            HomeViewController.self,
            MapViewController.self,
            ReviewViewController.self,
            MyPageViewController.self
        ]
        
        let coordinatorTypes: [AnyObject.Type] = [
            TabBarCoordinator.self,
            HomeCoordinator.self,
            MapCoordinator.self,
            ReviewCoordinator.self,
            MyPageCoordinator.self
        ]
 
        let allTypes = viewModelTypes + viewControllerTypes + coordinatorTypes
        
        register.unregisterPresentation(types: allTypes)
    }
    
    func resolveLoginPresentation() -> LoginCoordinator {
        resolveCoordinator(
            type: LoginCoordinator.self,
            registerAction: register.registerLoginPresentation
        )
    }
    
    func unregisterLoginPresentation() {
        let loginPresentation: [AnyObject.Type] = [
            LoginViewModel.self,
            LoginViewController.self,
            LoginCoordinator.self
        ]
        
        register.unregisterPresentation(types: loginPresentation)
    }
    
    func resolveRegionSettingPresentation() -> RegionSettingCoordinator {
        resolveCoordinator(
            type: RegionSettingCoordinator.self,
            registerAction: register.registerRegionSettingPresentation
        )
    }
}
