//
//  HomeFlowCoordinaterDependencies.swift
//  Nagaza
//
//  Created by 전성훈 on 2023/10/20.
//

import UIKit

/// Flow Coordinator는 DICiontainer의 Presentation만 알아야 하기 때문에 해당 부분만 delegate 패턴으로 채택해줍니다.
protocol HomeFlowCoordinaterDependencies {
    func makeHomeViewController(actions: HomeViewModelActions) -> HomeViewController
    func makeRegionSettingViewController(
        with subRegion: String,
        didSelect: @escaping RegionSettingViewModelDidSelectAction
    ) -> RegionSettingViewController
    func makeRegionSettingCoordinator(navigationController: UINavigationController) -> RegionSettingCoordinator
}

final class HomeFlowCoordinator: BaseCoordinator {
    
    private let dependencies: HomeFlowCoordinaterDependencies!
    
    init(
        navigationController: UINavigationController,
        dependencies: HomeFlowCoordinaterDependencies
    ) {
        self.dependencies = dependencies
        super.init(navigationController: navigationController)
    }
    
    override func start() {
        let actions = HomeViewModelActions(
            showRegionSetting: showRegionSetting(with: didSelect:),
            logoutTest: logoutTest
        )
        
        let vc = dependencies.makeHomeViewController(actions: actions)
        viewController = vc
        
        navigationController.setNavigationBarHidden(false, animated: false)
        navigationController.pushViewController(vc, animated: false)
    }
    
    private func showRegionSetting(
        with subRegion: String,
        didSelect: @escaping RegionSettingViewModelDidSelectAction
    ) {

        let regionSettingCoordinator = dependencies.makeRegionSettingCoordinator(
            navigationController: navigationController
        )
        regionSettingCoordinator.start(with: subRegion, didSelect: didSelect)
        
        childCoordinators.append(regionSettingCoordinator)
    }
    
    private func logoutTest() {
        // TODO: 추후 작성
    }
}
