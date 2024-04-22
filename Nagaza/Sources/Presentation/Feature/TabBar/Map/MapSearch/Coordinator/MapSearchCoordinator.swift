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
    
    override func start(navigationController: UINavigationController) {
        self.navigationController = navigationController
        
        mapSerachVC.setCoordinatorActions(with: self)
        
        navigationController.pushViewController(mapSerachVC, animated: true)
    }
}

extension MapSearchCoordinator: MapSearchCoordinatorActions {
    
}
