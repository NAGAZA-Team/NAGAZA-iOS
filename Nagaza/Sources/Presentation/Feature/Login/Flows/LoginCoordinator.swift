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
    private var window: UIWindow?
    private var rootViewController: UIViewController? {
        didSet {
            window?.rootViewController = rootViewController
            window?.makeKeyAndVisible()
        }
    }
        
    func start(with window: UIWindow, navigationController: UINavigationController) {
        self.window = window

        if let loginVC = DIContainer.shared.resolve(LoginViewController.self)
        self.navigationController = navigationController
        self.navigationController?.pushViewController(loginVC, animated: true)
        
        rootViewController = loginVC
        
    }
}
