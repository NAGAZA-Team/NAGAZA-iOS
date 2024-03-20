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
}

final class HomeFlowCoordinator: Coordinator {
    var type: CoordinatorType { .home }
    
    var childCoordinators: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    weak var finishDelegate: CoordinatorFinishDelegate?
    weak var tabBarDelegate: TabBarDelegate?
    
    private let dependencies: HomeFlowCoordinaterDependencies!
    
    private weak var homeVC: HomeViewController?
    
    init(
        navigationController: UINavigationController,
        dependencies: HomeFlowCoordinaterDependencies
    ) {
        self.navigationController = navigationController
        self.dependencies = dependencies
    }
    
    func start() {
        let actions = HomeViewModelActions(
            showRegionSetting: showRegionSetting(with: didSelect:),
            logoutTest: logoutTest
        )
        
        let vc = dependencies.makeHomeViewController(actions: actions)
        
        navigationController.setNavigationBarHidden(false, animated: false)
        navigationController.pushViewController(vc, animated: false)
        
        homeVC = vc
    }
    
    private func showRegionSetting(
        with subRegion: String,
        didSelect: @escaping RegionSettingViewModelDidSelectAction
    ) {
        let vc = dependencies.makeRegionSettingViewController(with: subRegion, didSelect: didSelect)
        
        navigationController.pushViewController(vc, animated: false)
    }
    
    private func logoutTest() {
        self.finish()
    }
}
