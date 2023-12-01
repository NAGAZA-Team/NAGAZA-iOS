//
//  MainSceneDIContainer.swift
//  Nagaza
//
//  Created by 전성훈 on 2023/11/07.
//

import UIKit

final class MainSceneDIContainer: HomeFlowCoordinaterDependencies {
    
    func makeMainViewController(actions: MainViewModelActions) -> HomeViewController {
        HomeViewController.create(with: makeMainViewModel(actions: actions))
    }
    
    private func makeMainViewModel(actions: MainViewModelActions) -> HomeViewModel {
        HomeViewModel(actions: actions)
    }
    
    func makeMainFlowCoordinator(
        navigationController: UINavigationController
    ) -> HomeFlowCoordinator {
        HomeFlowCoordinator(
            navigationController: navigationController,
            dependencies: self
        )
    }
}
