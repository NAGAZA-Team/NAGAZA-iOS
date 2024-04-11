//
//  RegionSettingCoordinator.swift
//  Nagaza
//
//  Created by 강조은 on 4/10/24.
//

import UIKit

final class RegionSettingCoordinator: BaseCoordinator {
    private var dependencies: HomeFlowCoordinaterDependencies!
    
    init(
        navigationController: UINavigationController,
        dependencies: HomeFlowCoordinaterDependencies
    ) {
        super.init(navigationController: navigationController)
        self.dependencies = dependencies
    }
    
    func start(
        with subRegion: String,
        didSelect: @escaping RegionSettingViewModelDidSelectAction
    ) {
        let vc = dependencies.makeRegionSettingViewController(
            with: subRegion,
            didSelect: didSelect
        )
        viewController = vc
        navigationController.pushViewController(viewController,
                                                animated: true)
    }
}
