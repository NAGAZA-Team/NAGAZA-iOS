//
//  LoginFlowCoordinator.swift
//  Nagaza
//
//  Created by 전성훈 on 2023/11/07.
//

import UIKit

final class LoginFlowCoordinator: BaseCoordinator {
    private var window: UIWindow?

    private var rootViewController: UIViewController? {
        didSet {
            window?.rootViewController = rootViewController
            window?.makeKeyAndVisible()
        }
    }

    override var navigationController: UINavigationController? {
        get { return super.navigationController }
        set { super.navigationController = newValue }
    }
    
    override func start(with window: UIWindow, navigationController: UINavigationController) {
        self.window = window

        let loginVC = DIContainer.shared.resolve(LoginViewController.self)
        self.navigationController = navigationController
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        self.navigationController?.pushViewController(loginVC, animated: false)
        
        rootViewController = navigationController
    }
}

extension LoginFlowCoordinator: LoginCoordinatorActions {
    func navigateToMainTabBar() {
        finishDelegate?.coordinatorDidFinish(childCoordinator: self)
    }
}
