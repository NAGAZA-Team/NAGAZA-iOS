//
//  HomeSceneDIContainer.swift
//  Nagaza
//
//  Created by 전성훈 on 2023/11/07.
//

import UIKit

final class HomeSceneDIContainer: HomeFlowCoordinaterDependencies {
    
    func makeHomeViewController(actions: HomeViewModelActions) -> HomeViewController {
        return HomeViewController.create(with: makeHomeViewModel(actions: actions))
    }
    
    private func makeHomeUseCase() -> HomeRepositoryInterface {
        return HomeRepository(
            isStub: true,
            sampleStatusCode: 200,
            customEndpointClosure: nil
        )
    }
    
    private func makeHomeViewModel(actions: HomeViewModelActions) -> HomeViewModel {
        return HomeViewModel(homeUseCase: makeHomeUseCase(), actions: actions)
    }
    
    func makeHomeFlowCoordinator(
        navigationController: UINavigationController
    ) -> HomeFlowCoordinator {
        HomeFlowCoordinator(
            navigationController: navigationController,
            dependencies: self
        )
    }
}
