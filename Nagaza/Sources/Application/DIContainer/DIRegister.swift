//
//  DIRegister.swift
//  Nagaza
//
//  Created by 전성훈 on 4/9/24.
//

import Foundation

final class DIRegister {
    static let shared = DIRegister()
    
    private var container = DIContainer.sharedContainer()
    
    private init() { }
    
    func setContainer(_ newContainer: DIContainerProtocol) {
        container = newContainer
    }
    
    func registerDIContainer() {
        registerRepository()
        registerUseCase()
        registerFirstAppPresentation()
    }
    
    // MARK: - Repository
    private func registerRepository() {
        // home
        container.register(
            HomeRepository.self,
            dependency: HomeRepository()
        )
        
        // regionSetting
        container.register(
            RegionSettingRepository.self,
            dependency: RegionSettingRepository(
                regionSettingStorage: UserDefaultsRegionSettingStorage()
            )
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
              let mapSearchRepository = container.resolve(MapSearchRepository.self),
              let regionSettingRepository = container.resolve(RegionSettingRepository.self)
        else { return }
        
        // home
        container.register(
            DefaultHomeUseCase.self,
            dependency: DefaultHomeUseCase(
                roomsRepository: homeRepository
            )
        )
        
        container.register(
            RegionSettingUseCase.self,
            dependency: RegionSettingUseCase(
                regionSettingRepository: regionSettingRepository
            )
        )
        
        // map
        container.register(
            DefaultMapSearchUseCase.self,
            dependency: DefaultMapSearchUseCase(roomsRepository: mapSearchRepository)
        )
    }
    
}

// MARK: - Presentation
extension DIRegister {    
    /// Splash / App Coordinator
    private func registerFirstAppPresentation() {
        container.register(
            SplashViewController.self,
            dependency: SplashViewController()
        )
        
        guard let splashVC = container.resolve(SplashViewController.self) else { return }
        container.register(
            AppCoordinator.self,
            dependency: AppCoordinator(splashVC: splashVC)
        )
    }
    
    // MARK: - Login
    func registerLoginPresentation() {
        container.register(
            LoginViewModel.self,
            dependency: LoginViewModel()
        )
        
        guard let loginVM = container.resolve(LoginViewModel.self) else { return }
        container.register(
            LoginViewController.self,
            dependency: LoginViewController(
                viewModel: loginVM
            )
        )
        
        guard let loginVC = container.resolve(LoginViewController.self) else { return }
        container.register(
            LoginCoordinator.self,
            dependency: LoginCoordinator(loginVC: loginVC)
        )
    }
    
    // MARK: - TabBar
    /// TabBars Presentation
    func registerTabBarsPresentation() {
        container.register(
            NagazaTabBarController.self,
            dependency: NagazaTabBarController()
        )
        
        guard let tabBarVC = container.resolve(NagazaTabBarController.self) else { return }
        container.register(
            TabBarCoordinator.self,
            dependency: TabBarCoordinator(
                tabBarVC: tabBarVC
            )
        )
        
        registerHomePresentation()
        registerMapPresentation()
        registerReviewPresentation()
        registerMyPagePresentation()
    }
    
    // MARK: Home
    private func registerHomePresentation() {
        guard let homeUseCase = container.resolve(DefaultHomeUseCase.self),
              let regionSettingUseCase = container.resolve(RegionSettingUseCase.self)
        else { return }
        container.register(
            HomeViewModel.self,
            dependency: HomeViewModel(
                homeUseCaseInterface: homeUseCase,
                regionSettingUseCase: regionSettingUseCase
            )
        )
        
        guard let homeVM = container.resolve(HomeViewModel.self) else { return }
        container.register(
            HomeViewController.self,
            dependency: HomeViewController(
                viewModel: homeVM
            )
        )
        
        guard let homeVC = container.resolve(HomeViewController.self) else { return }
        container.register(
            HomeCoordinator.self,
            dependency: HomeCoordinator(
                homeVC: homeVC
            )
        )
    }
    
    // MARK: Map
    private func registerMapPresentation() {
        container.register(
            MapViewModel.self,
            dependency: MapViewModel()
        )
        
        guard let mapVM = container.resolve(MapViewModel.self) else { return }
        container.register(
            MapViewController.self,
            dependency: MapViewController(
                viewModel: mapVM
            )
        )
        
        guard let mapVC = container.resolve(MapViewController.self) else { return }
        container.register(
            MapCoordinator.self,
            dependency: MapCoordinator(
                mapVC: mapVC
            )
        )
    }
    
    // MARK: Review
    private func registerReviewPresentation() {
        container.register(
            ReviewViewModel.self,
            dependency: ReviewViewModel()
        )
        
        guard let reviewVM = container.resolve(ReviewViewModel.self) else { return }
        container.register(
            ReviewViewController.self,
            dependency: ReviewViewController(viewModel: reviewVM)
        )
        
        guard let reviewVC = container.resolve(ReviewViewController.self) else { return }
        container.register(
            ReviewCoordinator.self,
            dependency: ReviewCoordinator(
                reviewVC: reviewVC
            )
        )
    }
    
    // MARK: MyPage
    private func registerMyPagePresentation() {
        container.register(
            MyPageViewModel.self,
            dependency: MyPageViewModel()
        )
        
        guard let myPageVM = container.resolve(MyPageViewModel.self) else { return }
        container.register(
            MyPageViewController.self,
            dependency: MyPageViewController(
                viewModel: myPageVM
            )
        )
        
        guard let myPageVC = container.resolve(MyPageViewController.self) else { return }
        container.register(
            MyPageCoordinator.self,
            dependency: MyPageCoordinator(
                myPageVC: myPageVC
            )
        )
    }
    
    // MARK: Region Setting
    func registerRegionSettingPresentation() {
        guard let regionSettingUseCase = container.resolve(RegionSettingUseCase.self) else { return }
        container.register(
            RegionSettingViewModel.self,
            dependency: RegionSettingViewModel(
                regionSettingUseCase: regionSettingUseCase
            )
        )
        
        guard let regionSettingVM = container.resolve(RegionSettingViewModel.self) else { return }
        container.register(
            RegionSettingViewController.self,
            dependency: RegionSettingViewController(
                viewModel: regionSettingVM
            )
        )
        
        guard let regionSettingVC = container.resolve(RegionSettingViewController.self) else { return }
        container.register(
            RegionSettingCoordinator.self,
            dependency: RegionSettingCoordinator(
                regionSettingVC: regionSettingVC
            )
        )
    }
    
    // MARK: Map Search
    func registerMapSearchPresentation() {
        guard let mapSearchUseCase = container.resolve(DefaultMapSearchUseCase.self) else { return }
        container.register(
            MapSearchViewModel.self,
            dependency: MapSearchViewModel(
                mapUseCase: mapSearchUseCase
            )
        )
        
        guard let mapSearchVM = container.resolve(MapSearchViewModel.self) else { return }
        container.register(
            MapSearchViewController.self,
            dependency: MapSearchViewController(
                viewModel: mapSearchVM
            )
        )
        
        guard let mapSearchVC = container.resolve(MapSearchViewController.self) else { return }
        container.register(
            MapSearchCoordinator.self,
            dependency: MapSearchCoordinator(
                mapSearchVC: mapSearchVC
            )
        )
    }
    
    // MARK: App Setting
    func registerAppSettingPresentation() {
        container.register(
            AppSettingViewModel.self,
            dependency: AppSettingViewModel()
        )
        
        guard let appSettingVM = container.resolve(AppSettingViewModel.self) else { return }
        container.register(
            AppSettingViewController.self,
            dependency: AppSettingViewController(
                viewModel: appSettingVM
            )
        )
        
        guard let appSettingVC = container.resolve(AppSettingViewController.self) else { return }
        container.register(
            AppSettingCoordinator.self,
            dependency: AppSettingCoordinator(
                appSettingVC: appSettingVC
            )
        )
    }
    
}
