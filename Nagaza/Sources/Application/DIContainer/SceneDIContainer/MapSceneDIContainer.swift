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
    
    private func makeMapViewModel(actions: MapViewModelActions) -> MapViewModel
    {
        MapViewModel(actions: actions)
    }
    
    func makeMapFlowCoordinator(navigationController: UINavigationController) -> MapFlowCoordinator {
        MapFlowCoordinator(
            navigationController: navigationController,
            dependencies: self
        )
    }
}
