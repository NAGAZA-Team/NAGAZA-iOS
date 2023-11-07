//
//  MainViewFlowCoordinator.swift
//  Nagaza
//
//  Created by 전성훈 on 2023/10/20.
//

import UIKit

protocol MainFlowCoordinaterDependencies {
    func makeMainViewController(actions: MainViewModelActions) -> MainViewController
}

final class MainFlowCoordinator: Coordinator {
    var type: CoordinatorType { .home }
    
    var childCoordinators: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    weak var finishDelegate: CoordinatorFinishDelegate?
    weak var tabBarDelegate: TabBarDelegate?
    
    private let dependencies: MainFlowCoordinaterDependencies!
    
    private weak var mainVC: MainViewController?
    
    init(
        navigationController: UINavigationController,
        dependencies: MainFlowCoordinaterDependencies
    ) {
        self.navigationController = navigationController
        self.dependencies = dependencies
        
        print("Main FlowCoordinator Init")
    }
    
    deinit {
        print("Main FlowCoordinator Deinit")
    }
    
    func start() {
        let actions = MainViewModelActions(logoutTest: { [weak self] in self?.finish() })
        let vc = dependencies.makeMainViewController(actions: actions)
        
        navigationController.setNavigationBarHidden(true, animated: false)
        navigationController.pushViewController(vc, animated: false)
        
        mainVC = vc
    }
}
