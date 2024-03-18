//
//  HomeSceneDIContainer.swift
//  Nagaza
//
//  Created by 전성훈 on 2023/11/07.
//

import UIKit

final class HomeSceneDIContainer {

    // AppDicontainer에서 Infra Service를 주입 받습니다.
    struct Dependencies {
        
    }
    
    private let dependencies: Dependencies
    
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
    
    // MARK: - Domain

    private func makeHomeUseCase() -> HomeRepositoryInterface {
        return HomeRepository(
            isStub: true,
            sampleStatusCode: 200,
            customEndpointClosure: nil
        )
    }
        
    func makeRegionSettingUseCase() -> RegionSettingUseCase {
        DefaultRegionSettingUseCase()
    }

}

// MARK: - Data
extension HomeSceneDIContainer {
    
}

// MARK: - Presentation
extension HomeSceneDIContainer: HomeFlowCoordinaterDependencies {
    // Home Flow Coordinator
    func makeHomeFlowCoordinator(
        navigationController: UINavigationController
    ) -> HomeFlowCoordinator {
        HomeFlowCoordinator(
            navigationController: navigationController,
            dependencies: self
        )
    }
    
    // MARK: Make Home ViewModel - ViewController
    private func makeHomeViewModel(
        actions: HomeViewModelActions
    ) -> HomeViewModel {
        return HomeViewModel(homeUseCase: makeHomeUseCase(), actions: actions)
    }
    
    func makeHomeViewController(
        actions: HomeViewModelActions
    ) -> HomeViewController {
        return HomeViewController.create(with: makeHomeViewModel(actions: actions))
    }
    
    // MARK: Make Region Setting ViewModel - ViewController
    private func makeRegionSettingViewModel(
        with subRegion: String
    ) -> RegionSettingViewModel {
        return RegionSettingViewModel(
            regionSettingUseCase: makeRegionSettingUseCase(),
            firstSubRegion: subRegion
        )
    }
    
    func makeRegionSettingViewController(
        with subRegion: String
    ) -> RegionSettingViewController {
        return RegionSettingViewController.create(
            with: makeRegionSettingViewModel(with: subRegion)
        )
    }
}
