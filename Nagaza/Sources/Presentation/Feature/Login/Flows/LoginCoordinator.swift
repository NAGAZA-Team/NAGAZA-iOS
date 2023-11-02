//
//  LoginCoordinator.swift
//  Nagaza
//
//  Created by SeungMin on 2023/11/01.
//

import UIKit

protocol LoginCoordinatorDependencies {
    func makeLoginViewController() -> LoginViewController
}

final class LoginCoordinator {
    private let dependencies: LoginCoordinatorDependencies
    
    init(dependencies: LoginCoordinatorDependencies) {
        self.dependencies = dependencies
    }
    
    func start() {
        let loginViewController = dependencies.makeLoginViewController()
        let navigationController = UINavigationController(rootViewController: loginViewController)
        UIWindow.keyWindow?.rootViewController = navigationController
        UIWindow.keyWindow?.makeKeyAndVisible()
    }
}
