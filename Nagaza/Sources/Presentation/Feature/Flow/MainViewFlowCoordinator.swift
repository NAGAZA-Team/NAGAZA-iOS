//
//  MainViewFlowCoordinator.swift
//  Nagaza
//
//  Created by 전성훈 on 2023/10/20.
//

import UIKit

protocol MainViewFlowCoordinaterDependencies {
    func makeMainViewController(actions: MainViewModelActions) -> MainViewController
}

final class MainViewFlowCoordinator {
    private weak var navigiationController: UINavigationController?
    private let dependencies: MainViewFlowCoordinaterDependencies
    
    private weak var mainVC: MainViewController?
    
    init(
        navigiationController: UINavigationController,
        dependencies: MainViewFlowCoordinaterDependencies
    ) {
        self.navigiationController = navigiationController
        self.dependencies = dependencies
    }
    
    func start() {
        let actions = MainViewModelActions()
        let vc = dependencies.makeMainViewController(actions: actions)
        
        navigiationController?.pushViewController(vc, animated: false)
        
        mainVC = vc
    }
}
