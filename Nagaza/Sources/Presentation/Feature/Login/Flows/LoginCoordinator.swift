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
        
    func start(with window: UIWindow) {
        self.window = window
        let loginViewController = dependencies.makeLoginViewController()
        let navigationController = UINavigationController(rootViewController: loginViewController)
        UIWindow.keyWindow?.rootViewController = navigationController
        UIWindow.keyWindow?.makeKeyAndVisible()
    }
}
