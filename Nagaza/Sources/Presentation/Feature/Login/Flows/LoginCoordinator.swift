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

final class LoginCoordinator: BaseCoordinator {
    private let dependencies: LoginCoordinatorDependencies
    
    init(
        navigationController: UINavigationController,
        dependencies: LoginCoordinatorDependencies
    ) {
        self.dependencies = dependencies
        super.init(navigationController: navigationController)
    }
    
    override func start() {
        let loginViewController = dependencies.makeLoginViewController()
        let navigationController = UINavigationController(rootViewController: loginViewController)
        UIWindow.keyWindow?.rootViewController = navigationController
        UIWindow.keyWindow?.makeKeyAndVisible()
    }
}
