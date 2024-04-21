//
//  DIRegister.swift
//  Nagaza
//
//  Created by 전성훈 on 4/9/24.
//

import Foundation

final class DIRegister {
    static let shared = DIRegister()
    let container = DIContainer.shared
    
    private init() { }
    
    func registerDIContainer() {
        registerRepository()
        registerUseCase()
        registerPresentation()
    }
    
    // MARK: - Repository
    private func registerRepository() {
        // home
        container.register(
            HomeRepository.self,
            dependency: HomeRepository()
        )
        
    }
    
    // MARK: - UseCase
    private func registerUseCase() {
        // home
        container.register(
            DefaultHomeUseCase.self,
            dependency: DefaultHomeUseCase(
                roomsRepository: container.resolve(HomeRepository.self)
            )
        )
        container.register(
            DefaultRegionSettingUseCase.self,
            dependency: DefaultRegionSettingUseCase()
        )
    }

    // MARK: - Presentation
    private func registerPresentation() {
        registerFirstPresentation()
        registerLoginPresentation()
        registerTabBarPresentation()
        
        registerHomePresentation()
        registerRegionSettingPresentation()
                
        registerMapPresentation()
        
        registerReviewPresentation()
        
        registerMyPagePresentation()
    }

    /// Splash / App Coordinator
    private func registerFirstPresentation() {
        container.register(
            SplashViewController.self,
            dependency: SplashViewController()
        )
        container.register(
            AppFlowCoordinator.self,
            dependency: AppFlowCoordinator()
        )
    }

    /// Login Presentation
    private func registerLoginPresentation() {
        container.register(
            LoginFlowCoordinator.self,
            dependency: LoginFlowCoordinator()
        )
        container.register(
            LoginViewModel.self,
            dependency: LoginViewModel(actions: <#T##_#>)
        )
        container.register(
            LoginViewController.self,
            dependency: LoginViewController(
                viewModel: container.resolve(LoginViewModel.self)
            )
        )
    }
    
    /// TabBar Presentation
    private func registerTabBarPresentation() {
        container.register(
            TabBarFlowCoordinator.self,
            dependency: TabBarFlowCoordinator()
        )
        container.register(
            NagazaTabBarController.self,
            dependency: NagazaTabBarController()
        )
    }

    /// Home Presentation
    private func registerHomePresentation() {
        // Home Presentation
        container.register(
            HomeFlowCoordinator.self,
            dependency: HomeFlowCoordinator()
        )
        container.register(
            HomeViewModel.self,
            dependency: HomeViewModel(
                homeUseCaseInterface: <#T##any HomeUseCaseInterface#>,
                actions: <#T##HomeViewModelActions#>
            )
        )
        container.register(
            HomeViewController.self,
            dependency: HomeViewController(
                viewModel: container.resolve(HomeViewModel.self)
            )
        )
    }
    
    /// RegionSetting Presentation
    private func registerRegionSettingPresentation() {
        container.register(
            RegionSettingFlowCoordinator.self,
            dependency: RegionSettingFlowCoordinator()
        )
        container.register(
            RegionSettingViewModel.self,
            dependency: RegionSettingViewModel(
                regionSettingUseCase: <#T##any RegionSettingUseCase#>,
                didSelect: <#T##RegionSettingViewModelDidSelectAction##RegionSettingViewModelDidSelectAction##(String) -> Void#>
            )
        )
        container.register(
            RegionSettingViewController.self,
            dependency: RegionSettingViewController(
                viewModel: container.resolve(RegionSettingViewModel.self)
            )
        )
    }
    
    /// Map Presentation
    private func registerMapPresentation() {
        container.register(
            MapFlowCoordinator.self,
            dependency: MapFlowCoordinator()
        )
        container.register(
            MapViewModel.self,
            dependency: MapViewModel(actions: <#T##MapViewModelActions#>)
        )
        container.register(
            MapViewController.self,
            dependency: MapViewController(
                viewModel: container.resolve(MapViewModel.self)
            )
        )
    }
    
    /// Review Presentation
    private func registerReviewPresentation() {
        container.register(
            ReviewFlowCoordinator.self,
            dependency: ReviewFlowCoordinator()
        )
        container.register(
            ReviewViewModel.self,
            dependency: ReviewViewModel(
                actions: <#T##ReviewViewModelActions#>)
        )
        container.register(
            ReviewViewController.self,
            dependency: container.resolve(ReviewViewModel.self)
        )
    }
    
    /// MyPage Presentation
    private func registerMyPagePresentation() {
        container.register(
            MyPageFlowCoordinator.self,
            dependency: MyPageFlowCoordinator()
        )
        container.register(
            MyPageViewModel.self,
            dependency: MyPageViewModel(actions: <#T##MyPageViewModelActions#>)
        )
        container.register(
            MyPageViewController.self,
            dependency: MyPageViewController(
                viewModel: container.resolve(MyPageViewModel.self)
            )
        )
    }
}
