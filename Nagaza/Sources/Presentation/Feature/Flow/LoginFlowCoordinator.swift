//
//  LoginFlowCoordinator.swift
//  Nagaza
//
//  Created by 전성훈 on 2023/11/07.
//

import UIKit

final class LoginFlowCoordinator: BaseCoordinator {
    private var window: UIWindow?
    private var loginVC: UIViewController

    init(loginVC: UIViewController) {
        self.loginVC = loginVC
    }
    
    override func start(with window: UIWindow, navigationController: UINavigationController) {
        self.window = window
        
        self.navigationController = navigationController
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        self.navigationController?.pushViewController(loginVC, animated: false)

        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()
    }
}

//extension LoginFlowCoordinator: LoginCoordinatorActions {
//    func navigateToMainTabBar() {
//        finishDelegate?.coordinatorDidFinish(childCoordinator: self)
//    }
//}
