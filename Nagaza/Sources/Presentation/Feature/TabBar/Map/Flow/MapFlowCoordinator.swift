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

final class MapFlowCoordinator: Coordinator {
    var type: CoordinatorType { .map }
    
    var childCoordinators: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    weak var finishDelegate: CoordinatorFinishDelegate?
    weak var tabBarDelegate: TabBarDelegate?
    
    private let dependencies: MapFlowCoordinaterDependencies!
    
    private weak var mapVC: MapViewController?
    
    init(
        navigationController: UINavigationController,
        dependencies: MapFlowCoordinaterDependencies) {
            self.navigationController = navigationController
            self.dependencies = dependencies
        }
    
    deinit {
        print("Map Flow Deinit")
    }
    
    func start() {
        let actions = MapViewModelActions(toMapSearchVC: toMapSearchVC)
        let vc = dependencies.makeMapViewController(actions: actions)
        
        navigationController.setNavigationBarHidden(false, animated: false)
        navigationController = UINavigationController(rootViewController: vc)
        
        mapVC = vc
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
