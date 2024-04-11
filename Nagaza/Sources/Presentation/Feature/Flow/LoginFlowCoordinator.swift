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

final class LoginFlowCoordinator: BaseCoordinator {
    
    private let dependencies: LoginFlowCoordinatorDependencies!
    
    init(
        navigationController: UINavigationController,
        dependencies: LoginFlowCoordinatorDependencies
    ) {
        self.dependencies = dependencies
        super.init(navigationController: navigationController)
    }
    
    override func start() {
        let actions = LoginViewModelActions(showTabBar: showTabBar)
        let vc = dependencies.makeLoginViewController(actions: actions)
        
        navigationController.setNavigationBarHidden(true, animated: false)
        navigationController.pushViewController(vc, animated: false)
        
        viewController = vc
    }
    
    private func showTabBar() {
        // TODO: TabBarFlowCoordinator 띄우기
    }
}
