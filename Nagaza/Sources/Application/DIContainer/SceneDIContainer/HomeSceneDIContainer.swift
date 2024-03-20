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
    
    private func makeHomeUseCaseInterface() -> HomeUseCaseInterface {
        return DefaultHomeUseCase(
            roomsRepository: HomeRepository(
                isStub: true,
                sampleStatusCode: 200,
                customEndpointClosure: nil
            )
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
        return HomeViewModel(homeUseCaseInterface: makeHomeUseCaseInterface(), actions: actions)
    }
    
    func makeHomeViewController(
        actions: HomeViewModelActions
    ) -> HomeViewController {
        return HomeViewController.create(with: makeHomeViewModel(actions: actions))
    }
    
    // MARK: Make Region Setting ViewModel - ViewController
    private func makeRegionSettingViewModel(
        with subRegion: String,
        didSelect: @escaping RegionSettingViewModelDidSelectAction
    ) -> RegionSettingViewModel {
        return RegionSettingViewModel(
            regionSettingUseCase: makeRegionSettingUseCase(),
            subRegionFromHomeVC: subRegion,
            didSelect: didSelect
        )
    }
    
    func makeRegionSettingViewController(
        with subRegion: String,
        didSelect: @escaping RegionSettingViewModelDidSelectAction
    ) -> RegionSettingViewController {
        return RegionSettingViewController.create(
            with: makeRegionSettingViewModel(
                with: subRegion,
                didSelect: didSelect
            )
        )
    }
}
