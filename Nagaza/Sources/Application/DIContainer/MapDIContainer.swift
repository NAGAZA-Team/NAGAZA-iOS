//
//  MapDIContainer.swift
//  Nagaza
//
//  Created by SeungMin on 2023/11/01.
//

import UIKit

final class MapDIContainer {
    func makeMapCoordinator(navigationController: UINavigationController) -> MapCoordinator {
        return MapCoordinator(
            navigationController: navigationController,
            dependencies: self
        )
    }
}

extension MapDIContainer: MapCoordinatorDependencies {
    func makeMapViewModel() -> MapViewModel {
        return MapViewModel()
    }
    
    func makeMapViewController() -> MapViewController {
        return MapViewController(viewModel: self.makeMapViewModel())
    }
}
