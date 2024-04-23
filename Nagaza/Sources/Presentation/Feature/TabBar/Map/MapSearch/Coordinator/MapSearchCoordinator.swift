//
//  MapSearchCoordinator.swift
//  Nagaza
//
//  Created by 전성훈 on 4/22/24.
//

import UIKit

final class MapSearchCoordinator: BaseCoordinator {
    
    private var mapSerachVC: NagazaViewController
    
    init(mapSearchVC: NagazaViewController) {
        self.mapSerachVC = mapSearchVC
    }
    
    deinit {
        print("MapSearchCoordinator deinit")
    }
    
    override func start(navigationController: UINavigationController) {
        self.navigationController = navigationController
        
        mapSerachVC.setCoordinatorActions(with: self)
        
        navigationController.pushViewController(mapSerachVC, animated: true)
    }
}

extension MapSearchCoordinator: MapSearchCoordinatorActions {
    func popViewController() {
        guard let navigationController = navigationController else { return }

        navigationController.popViewController(animated: true)
        finishDelegate?.coordinatorDidFinish(childCoordinator: self)
        DIManager.shared.unregisterMapSearchPresentation()
    }
}
