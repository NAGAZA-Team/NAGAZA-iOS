//
//  LoginSceneDIContainer.swift
//  Nagaza
//
//  Created by 전성훈 on 2023/11/07.
//

import UIKit

final class LoginSceneDIContainer: LoginFlowCoordinatorDependencies {
    
    
    func makeLoginViewController(actinos: LoginViewModelActions) -> LoginViewController {
        LoginViewController.create(with: makeLoginViewModel(actions: actinos))
    }
    
    private func makeLoginViewModel(actions: LoginViewModelActions) -> LoginViewModel {
        LoginViewModel(actions: actions)
    }
    
    func makeLoginFlowCoordinator(navigationController: UINavigationController) -> LoginFlowCoordinator {
        LoginFlowCoordinator(
            navigationController: navigationController,
            dependencies: self
        )
    }
}
