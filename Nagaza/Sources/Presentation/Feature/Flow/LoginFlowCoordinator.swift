//
//  LoginFlowCoordinator.swift
//  Nagaza
//
//  Created by 전성훈 on 2023/11/07.
//

import UIKit

protocol LoginFlowCoordinatorDependencies {
    func makeLoginViewController(actions: LoginViewModelActions) -> LoginViewController
}

final class LoginFlowCoordinator: Coordinator {
    var type: CoordinatorType { .login }
    
    var childCoordinators: [Coordinator] = []
    
    var navigationController: UINavigationController

    weak var finishDelegate: CoordinatorFinishDelegate?
    weak var tabBarDelegate: TabBarDelegate? = nil
    
    private let dependencies: LoginFlowCoordinatorDependencies!
    
    private weak var loginVC: LoginViewController?
    
    init(
        navigationController: UINavigationController,
        dependencies: LoginFlowCoordinatorDependencies
    ) {
        self.navigationController = navigationController
        self.dependencies = dependencies
    }
    
    deinit {
        print("Login Flow Deinit")
    }
    
    func start() {
        let actions = LoginViewModelActions(showTabBar: showTabBar)
        let vc = dependencies.makeLoginViewController(actions: actions)
        
        navigationController.pushViewController(vc, animated: false)
        navigationController.setNavigationBarHidden(true, animated: false)

        loginVC = vc
    }
    
    private func showTabBar() {
        self.finish()
    }
}
