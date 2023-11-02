//
//  LoginDIContainer.swift
//  Nagaza
//
//  Created by SeungMin on 2023/11/01.
//

import UIKit

struct LoginDIContainer: LoginCoordinatorDependencies {
    func makeTabBarFlowCoordinator() -> LoginCoordinator {
        return LoginCoordinator(
            dependencies: self
        )
    }
    
    func makeLoginViewController() -> LoginViewController {
        return LoginViewController()
    }    
}
