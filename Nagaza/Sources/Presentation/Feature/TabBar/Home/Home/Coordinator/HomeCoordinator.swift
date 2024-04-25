//
//  HomeFlowCoordinaterDependencies.swift
//  Nagaza
//
//  Created by 전성훈 on 2023/10/20.
//

import UIKit

final class HomeCoordinator: BaseCoordinator {
    
    private var homeVC: NagazaViewController
    
    init(homeVC: NagazaViewController) {
        self.homeVC = homeVC
    }
    
    override func start(navigationController: UINavigationController) {
        self.navigationController = navigationController
        
        homeVC.setCoordinatorActions(with: self)
        
        navigationController.setNavigationBarHidden(false, animated: false)
        navigationController.pushViewController(homeVC, animated: false)
    }
    
//    private func showRegionSetting(
//        with subRegion: String,
//        didSelect: @escaping RegionSettingViewModelDidSelectAction
//    ) {
//
////        let regionSettingCoordinator = dependencies.makeRegionSettingCoordinator(
////            navigationController: navigationController
////        )
////        regionSettingCoordinator.start(with: subRegion, didSelect: didSelect)
////        
////        childCoordinators.append(regionSettingCoordinator)
//    }
}

extension HomeCoordinator: HomeCoordinatorActions {
    func pushRegionSetting() {
        guard let navigationController = navigationController else { return }
        let regionSettingCoordinator = DIManager.shared.resolveRegionSettingPresentation()

        addChildCoordinator(regionSettingCoordinator)
        
        regionSettingCoordinator.finishDelegate = self
        regionSettingCoordinator.start(navigationController: navigationController)
    }
}

extension HomeCoordinator: CoordinatorFinishDelegate {
    func coordinatorDidFinish(childCoordinator: Coordinator) {
        removeChildCoordinator(childCoordinator)
    }
}
