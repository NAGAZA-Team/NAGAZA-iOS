//
//  MainViewFlowCoordinator.swift
//  Nagaza
//
//  Created by 전성훈 on 2023/10/20.
//

import UIKit

protocol HomeFlowCoordinaterDependencies {
    func makeMainViewController(actions: MainViewModelActions) -> HomeViewController
}

final class HomeFlowCoordinator: Coordinator {
    var type: CoordinatorType { .home }
    
    var childCoordinators: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    weak var finishDelegate: CoordinatorFinishDelegate?
    weak var tabBarDelegate: TabBarDelegate?
    
    private let dependencies: HomeFlowCoordinaterDependencies!
    
    private weak var mainVC: HomeViewController?
    
    init(
        navigationController: UINavigationController,
        dependencies: HomeFlowCoordinaterDependencies
    ) {
        self.navigationController = navigationController
        self.dependencies = dependencies
    }
    
    func start() {
        let actions = MainViewModelActions(logoutTest: logoutTest)
        let vc = dependencies.makeMainViewController(actions: actions)
        
        navigationController.setNavigationBarHidden(true, animated: false)
        navigationController.pushViewController(vc, animated: false)
        
        mainVC = vc
    }
    
    private func logoutTest() {
        self.finish()
    }
}
