//
//  HomeFlowCoordinaterDependencies.swift
//  Nagaza
//
//  Created by 전성훈 on 2023/10/20.
//

import UIKit

protocol HomeFlowCoordinaterDependencies {
    func makeHomeViewController(actions: HomeViewModelActions) -> HomeViewController
}

final class HomeFlowCoordinator: Coordinator {
    var type: CoordinatorType { .home }
    
    var childCoordinators: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    weak var finishDelegate: CoordinatorFinishDelegate?
    weak var tabBarDelegate: TabBarDelegate?
    
    private let dependencies: HomeFlowCoordinaterDependencies!
    
    private weak var homeVC: HomeViewController?
    
    init(
        navigationController: UINavigationController,
        dependencies: HomeFlowCoordinaterDependencies
    ) {
        self.navigationController = navigationController
        self.dependencies = dependencies
    }
    
    func start() {
        let actions = HomeViewModelActions(logoutTest: logoutTest)
        let vc = dependencies.makeHomeViewController(actions: actions)
        
        navigationController.setNavigationBarHidden(false, animated: false)
        navigationController.pushViewController(vc, animated: false)
        
        homeVC = vc
    }
    
    private func logoutTest() {
        self.finish()
    }
}
