//
//  MapCoordinator.swift
//  Nagaza
//
//  Created by SeungMin on 2023/11/01.
//

import UIKit

protocol MapCoordinatorDependencies {
    func makeMapViewController() -> MapViewController
}

final class MapCoordinator {
    private let navigationController: UINavigationController
    private let dependencies: MapCoordinatorDependencies
    
    init(navigationController: UINavigationController,
         dependencies: MapCoordinatorDependencies) {
        self.navigationController = navigationController
        self.dependencies = dependencies
    }
    
    func start() {
        let mapViewController = dependencies.makeMapViewController()
        navigationController.pushViewController(mapViewController,
                                                animated: true)
    }
}
