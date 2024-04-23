//
//  MapFlowCoordinator.swift
//  Nagaza
//
//  Created by 전성훈 on 2023/11/07.
//

import UIKit

//protocol MapFlowCoordinaterDependencies {
//    func makeMapViewController(actions: MapViewModelActions) -> MapViewController
//    func makeMapSearchViewController(actions: MapSearchViewModelActions) -> MapSearchViewController
//}

final class MapCoordinator: BaseCoordinator {
//    private let dependencies: MapFlowCoordinaterDependencies!
    
//    init(
//        navigationController: UINavigationController,
//        dependencies: MapFlowCoordinaterDependencies
//    ) {
//        self.dependencies = dependencies
//        super.init(navigationController: navigationController)
//    }
    private var mapVC: NagazaViewController
    
    init(mapVC: NagazaViewController) {
        self.mapVC = mapVC
    }
    
    override func start(navigationController: UINavigationController) {
        self.navigationController = navigationController

        mapVC.setCoordinatorActions(with: self)
        
        navigationController.setNavigationBarHidden(false, animated: false)
        navigationController.pushViewController(mapVC, animated: false)
    }
    
    func toMapSearchVC() {
//        let actions = MapSearchViewModelActions(toMapVC: toMapVC)
//        let vc = dependencies.makeMapSearchViewController(actions: actions)
//        
//        navigationController.pushViewController(vc, animated: true)
    }
    
    func toMapVC(item: Place) {
//        navigationController.popViewController(animated: true)
//        
//        guard let mapVC = navigationController.topViewController as? MapViewController else { return }
//        mapVC.viewModel.searchItem.accept(item)
    }
}

extension MapCoordinator: MapCoordinatorActions {
    func pushMapSearch() {
        guard let navigationController = navigationController else { return }
        
        let mapSearchCoordinator = DIManager.shared.resolveMapSearchPresentation()

        addChildCoordinator(mapSearchCoordinator)

        mapSearchCoordinator.finishDelegate = self
        mapSearchCoordinator.start(navigationController: navigationController)
    }
}

extension MapCoordinator: CoordinatorFinishDelegate {
    func coordinatorDidFinish(childCoordinator: Coordinator) {
        removeChildCoordinator(childCoordinator)
    }
}
