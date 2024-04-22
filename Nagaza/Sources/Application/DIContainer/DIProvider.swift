//
//  DIProvider.swift
//  Nagaza
//
//  Created by 전성훈 on 4/22/24.
//

import Foundation

final class DIProvider {
    static let shared = DIProvider()

    let container = DIContainer.sharedContainer()
    let register = DIRegister.shared

    private init() { }
    
    func resolveCoordinatorsInTabBar() -> [BaseCoordinator] {
        let coordinatorTypes: [BaseCoordinator.Type] = [
                 TabBarFlowCoordinator.self,
                 HomeFlowCoordinator.self,
                 MapFlowCoordinator.self,
                 ReviewFlowCoordinator.self,
                 MyPageFlowCoordinator.self
             ]
                
        return coordinatorTypes.compactMap { type in
            if let coordinator = container.resolve(type) {
                return coordinator
            } else {
                register.registerTabBarsPresentation()
                return container.resolve(type)
            }
        }
    }
    
    func resolveLoginCoordinator() -> LoginFlowCoordinator {
        if let loginFlowCoordinator = container.resolve(LoginFlowCoordinator.self) {
            return loginFlowCoordinator
        } else {
            register.registerLoginPresentation()
            
            guard let reResolvedLoginCoordinator = container.resolve(LoginFlowCoordinator.self) else {
                fatalError("LoginFlowCoordinator 재등록 실패")
            }
            
            return reResolvedLoginCoordinator
        }
    }
}
