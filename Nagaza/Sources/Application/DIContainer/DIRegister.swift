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
        
        
        // map
        container.register(
            MapSearchRepository.self,
            dependency: MapSearchRepository()
        )
    }
    
    // MARK: - UseCase
    private func registerUseCase() {
        guard let homeRepository = container.resolve(HomeRepository.self),
              let mapSearchRepository = container.resolve(MapSearchRepository.self)
        else { return }
        
        // home
        container.register(
            DefaultHomeUseCase.self,
            dependency: DefaultHomeUseCase(
                roomsRepository: homeRepository
            )
        )
        
        container.register(
            DefaultRegionSettingUseCase.self,
            dependency: DefaultRegionSettingUseCase()
        )
        
        // map
        container.register(
            DefaultMapSearchUseCase.self,
            dependency: DefaultMapSearchUseCase(roomsRepository: mapSearchRepository)
        )
    }
    
    // MARK: - Presentation
    /// Splash / App Coordinator
    private func registerPresentation() {
        container.register(
            SplashViewController.self,
            dependency: SplashViewController()
        )
        
        guard let splashVC = container.resolve(SplashViewController.self) else { return }
        container.register(
            AppCoordinator.self,
            dependency: AppCoordinator(splashVC: splashVC)
        )
        
        registerLoginPresentation()
        registerTabBarPresentation()
    }
    
    /// Login Presentation
    func registerLoginPresentation() {
        container.register(
            LoginViewModel.self,
            dependency: LoginViewModel()
        )
        
        guard let loginViewModel = container.resolve(LoginViewModel.self) else { return }
        container.register(
            LoginViewController.self,
            dependency: LoginViewController(
                viewModel: loginViewModel
            )
        )
        
        guard let loginViewController = container.resolve(LoginViewController.self) else { return }
        container.register(
            LoginFlowCoordinator.self,
            dependency: LoginFlowCoordinator()
        )
    }
    
    /// TabBar Presentation
    func registerTabBarPresentation() {
        container.register(
            NagazaTabBarController.self,
            dependency: NagazaTabBarController()
        )
        
        guard let tabBarController = container.resolve(NagazaTabBarController.self) else { return }
        container.register(
            TabBarFlowCoordinator.self,
            dependency: TabBarFlowCoordinator(
                tabBarVC: tabBarController
            )
        )
        
        registerHomePresentation()
        registerRegionSettingPresentation()
        
        registerMapPresentation()
        registerMapSearchPresentation()
        
        registerReviewPresentation()
        
        registerMyPagePresentation()
        registerAppSettingPresentation()
    }
    
    /// Home Presentation
    private func registerHomePresentation() {
        guard let homeUseCase = container.resolve(DefaultHomeUseCase.self) else { return }
        container.register(
            HomeViewModel.self,
            dependency: HomeViewModel(
                homeUseCaseInterface: homeUseCase
            )
        )
        
        guard let homeViewModel = container.resolve(HomeViewModel.self) else { return }
        container.register(
            HomeViewController.self,
            dependency: HomeViewController(
                viewModel: homeViewModel
            )
        )
        
        guard let homeViewController = container.resolve(HomeViewController.self) else { return }
        container.register(
            HomeFlowCoordinator.self,
            dependency: HomeFlowCoordinator()
        )
    }
    
    /// RegionSetting Presentation
    private func registerRegionSettingPresentation() {
        guard let regionSettingUseCase = container.resolve(DefaultRegionSettingUseCase.self) else { return }
        container.register(
            RegionSettingViewModel.self,
            dependency: RegionSettingViewModel(
                regionSettingUseCase: regionSettingUseCase
            )
        )
        
        guard let regionSettingViewModel = container.resolve(RegionSettingViewModel.self) else { return }
        container.register(
            RegionSettingViewController.self,
            dependency: RegionSettingViewController(
                viewModel: regionSettingViewModel
            )
        )
        
        guard let regionSettingViewController = container.resolve(RegionSettingViewController.self) else { return }
        container.register(
            RegionSettingFlowCoordinator.self,
            dependency: RegionSettingFlowCoordinator()
        )
    }
    
    /// Map Presentation
    private func registerMapPresentation() {
        container.register(
            MapViewModel.self,
            dependency: MapViewModel()
        )
        
        guard let mapViewModel = container.resolve(MapViewModel.self) else { return }
        container.register(
            MapViewController.self,
            dependency: MapViewController(
                viewModel: mapViewModel
            )
        )
        
        guard let mapViewController = container.resolve(MapViewController.self) else { return }
        container.register(
            MapFlowCoordinator.self,
            dependency: MapFlowCoordinator()
        )
    }
    
    /// Map Serach Presentation
    private func registerMapSearchPresentation() {
        guard let mapSearchUseCase = container.resolve(DefaultMapSearchUseCase.self) else { return }
        container.register(
            MapSearchViewModel.self,
            dependency: MapSearchViewModel(
                mapUseCase: mapSearchUseCase
            )
        )
        
        guard let mapSearchViewModel = container.resolve(MapSearchViewModel.self) else { return }
        container.register(
            MapSearchViewController.self,
            dependency: MapSearchViewController()
        )
        
        guard let mapSearchViewController = container.resolve(MapSearchViewController.self) else { return }
        container.register(
            MapSearchCoordinator.self,
            dependency: MapSearchCoordinator(viewController: mapSearchViewController)
        )
    }
    
    /// Review Presentation
    private func registerReviewPresentation() {
        container.register(
            ReviewViewModel.self,
            dependency: ReviewViewModel()
        )
        
        guard let reviewViewModel = container.resolve(ReviewViewModel.self) else { return }
        container.register(
            ReviewViewController.self,
            dependency: ReviewViewController(viewModel: reviewViewModel)
        )
        
        guard let reviewViewController = container.resolve(ReviewViewController.self) else { return }
        container.register(
            ReviewFlowCoordinator.self,
            dependency: ReviewFlowCoordinator(viewController: reviewViewController)
        )
    }
    
    /// MyPage Presentation
    private func registerMyPagePresentation() {
        container.register(
            MyPageViewModel.self,
            dependency: MyPageViewModel()
        )
        
        guard let myPageViewModel = container.resolve(MyPageViewModel.self) else { return }
        container.register(
            MyPageViewController.self,
            dependency: MyPageViewController(
                viewModel: myPageViewModel
            )
        )
        
        container.register(
            MyPageFlowCoordinator.self,
            dependency: MyPageFlowCoordinator()
        )
    }
    
    /// App Setting Presentation
    private func registerAppSettingPresentation() {
        container.register(
            MyPageAppSettingViewModel.self,
            dependency: MyPageAppSettingViewModel()
        )
        
        guard let appSettingViewModel = container.resolve(MyPageAppSettingViewModel.self) else { return }
        container.register(
            MyPageAppSettingViewController.self,
            dependency: MyPageAppSettingViewController(
                viewModel: appSettingViewModel
            )
        )
        
        guard let appSettingViewController = container.resolve(MyPageViewController.self) else { return }
        container.register(
            MyPageAppSettingCoordinator.self,
            dependency: MyPageAppSettingCoordinator(
                viewController: appSettingViewController
            )
        )
    }
    
}
