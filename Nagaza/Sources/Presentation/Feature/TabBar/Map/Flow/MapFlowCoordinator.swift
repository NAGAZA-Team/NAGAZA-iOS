//
//  MapFlowCoordinator.swift
//  Nagaza
//
//  Created by 전성훈 on 2023/11/07.
//

import UIKit

protocol MapFlowCoordinaterDependencies {
    func makeMapViewController(actions: MapViewModelActions) -> MapViewController
    func makeMapSearchViewController(actions: MapSearchViewModelActions) -> MapSearchViewController
}

final class MapFlowCoordinator: BaseCoordinator {
    private let dependencies: MapFlowCoordinaterDependencies!
    
    init(
        navigationController: UINavigationController,
        dependencies: MapFlowCoordinaterDependencies
    ) {
        self.dependencies = dependencies
        super.init(navigationController: navigationController)
    }
    
    override func start() {
        let actions = MapViewModelActions(toMapSearchVC: toMapSearchVC)
        let vc = dependencies.makeMapViewController(actions: actions)
        
        navigationController.setNavigationBarHidden(false, animated: false)
        navigationController = UINavigationController(rootViewController: vc)
        
        viewController = vc
    }
    
    func toMapSearchVC() {
        let actions = MapSearchViewModelActions(toMapVC: toMapVC)
        let vc = dependencies.makeMapSearchViewController(actions: actions)
        
        navigationController.pushViewController(vc, animated: true)
    }
    
    func toMapVC(item: Place) {
        navigationController.popViewController(animated: true)
        
        guard let mapVC = navigationController.topViewController as? MapViewController else { return }
        mapVC.viewModel.searchItem.accept(item)
    }
}
