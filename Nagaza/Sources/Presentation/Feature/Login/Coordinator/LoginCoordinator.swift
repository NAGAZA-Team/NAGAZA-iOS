//
//  LoginFlowCoordinator.swift
//  Nagaza
//
//  Created by 전성훈 on 2023/11/07.
//

import UIKit

final class LoginCoordinator: BaseCoordinator {
    private var window: UIWindow?
    private var loginVC: NagazaViewController

    init(loginVC: NagazaViewController) {
        self.loginVC = loginVC
    }
    
    override func start(with window: UIWindow, navigationController: UINavigationController) {
        self.window = window
        
        loginVC.setCoordinatorActions(with: self)
        
        self.navigationController = navigationController
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        self.navigationController?.pushViewController(loginVC, animated: false)

        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()
    }
}

extension LoginCoordinator: LoginCoordinatorActions {
    func pushTabBar() {
        DIManager.shared.unregisterLoginPresentation()
        
        finishDelegate?.coordinatorDidFinish(childCoordinator: self)
    }
}
