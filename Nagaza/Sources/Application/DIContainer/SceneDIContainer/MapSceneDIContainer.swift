//
//  MapSceneDIContainer.swift
//  Nagaza
//
//  Created by 전성훈 on 2023/11/07.
//

import UIKit

final class MapSceneDIContainer: MapFlowCoordinaterDependencies {
    func makeMapViewController(actions: MapViewModelActions) -> MapViewController {
        MapViewController.create(with: makeMapViewModel(actions: actions))
    }
    
    private func makeMapViewModel(actions: MapViewModelActions) -> MapViewModel {
        MapViewModel(actions: actions)
    }
    
    func makeMapSearchViewController(actions: MapSearchViewModelActions) -> MapSearchViewController {
        MapSearchViewController.create(with: makeMapSearchViewModel(actions: actions))
    }
    
    private func makeMapUseCase() -> MapRepositoryInterface {
        return MapRepository(
            isStub: true,
            sampleStatusCode: 200,
            customEndpointClosure: nil
        )
    }
    
    private func makeMapSearchViewModel(actions: MapSearchViewModelActions) -> MapSearchViewModel {
        MapSearchViewModel(mapUseCase: makeMapUseCase(), actions: actions)
    }
    
    func makeMapFlowCoordinator(navigationController: UINavigationController) -> MapFlowCoordinator {
        MapFlowCoordinator(
            navigationController: navigationController,
            dependencies: self
        )
    }
}
