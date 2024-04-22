//
//  DIContainerTests.swift
//  NagazaTests
//
//  Created by 전성훈 on 4/21/24.
//

import XCTest

@testable import Nagaza

final class DIContainerTests: XCTestCase {
    var container: DIContainerProtocol!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        let testContainer = MockDIContainer.sharedContainer()
        container = testContainer
        
        DIRegister.shared.setContainer(testContainer)
        DIRegister.shared.registerDIContainer()
    }
    
    override func tearDownWithError() throws {
        container.reset()
        
        try super.tearDownWithError()
    }
    
    func test_AllComponentsAreRegistered() {
        // 테스트 코드에선 굳이 [weak self] 안 해도 괜찮음
        // 그렇지만 일관된 코드 작성을 위해 추가해봄
        let components: [() -> Void] = [
            // MARK: - Repository
            { [weak self] in self?.assertComponentIsRegistered(type: HomeRepository.self)},
            { [weak self] in self?.assertComponentIsRegistered(type: MapSearchRepository.self)},
            
            // MARK: - Use Case
            { [weak self] in self?.assertComponentIsRegistered(type: DefaultHomeUseCase.self)},
            { [weak self] in self?.assertComponentIsRegistered(type: DefaultRegionSettingUseCase.self)},
            { [weak self] in self?.assertComponentIsRegistered(type: DefaultMapSearchUseCase.self)},
            
            // MARK: - Presentation
            // First Presentation
            { [weak self] in self?.assertComponentIsRegistered(type: SplashViewController.self)},
            { [weak self] in self?.assertComponentIsRegistered(type: AppCoordinator.self)},
            
            // Login Presentation
            { [weak self] in self?.assertComponentIsRegistered(type: LoginViewModel.self)},
            { [weak self] in self?.assertComponentIsRegistered(type: LoginViewController.self)},
            { [weak self] in self?.assertComponentIsRegistered(type: LoginCoordinator.self)},

            // TabBar Presentation
            { [weak self] in self?.assertComponentIsRegistered(type: NagazaTabBarController.self)},
            { [weak self] in self?.assertComponentIsRegistered(type: TabBarFlowCoordinator.self)},

            // Home Presentation
            { [weak self] in self?.assertComponentIsRegistered(type: HomeViewModel.self)},
            { [weak self] in self?.assertComponentIsRegistered(type: HomeViewController.self)},
            { [weak self] in self?.assertComponentIsRegistered(type: HomeCoordinator.self)},

            // Region Setting Presentation
            { [weak self] in self?.assertComponentIsRegistered(type: RegionSettingViewModel.self)},
            { [weak self] in self?.assertComponentIsRegistered(type: RegionSettingViewController.self)},
            { [weak self] in self?.assertComponentIsRegistered(type: RegionSettingCoordinator.self)},

            // Map Presentation
            { [weak self] in self?.assertComponentIsRegistered(type: MapViewModel.self)},
            { [weak self] in self?.assertComponentIsRegistered(type: MapViewController.self)},
            { [weak self] in self?.assertComponentIsRegistered(type: MapCoordinator.self)},

            // Map Search Presentation
            { [weak self] in self?.assertComponentIsRegistered(type: MapSearchViewModel.self)},
            { [weak self] in self?.assertComponentIsRegistered(type: MapSearchViewController.self)},
            { [weak self] in self?.assertComponentIsRegistered(type: MapSearchCoordinator.self)},
            
            // Review Presentation
            { [weak self] in self?.assertComponentIsRegistered(type: ReviewViewModel.self)},
            { [weak self] in self?.assertComponentIsRegistered(type: ReviewViewController.self)},
            { [weak self] in self?.assertComponentIsRegistered(type: ReviewCoordinator.self)},

            // My Page Presentation
            { [weak self] in self?.assertComponentIsRegistered(type: MyPageViewModel.self)},
            { [weak self] in self?.assertComponentIsRegistered(type: MyPageViewController.self)},
            { [weak self] in self?.assertComponentIsRegistered(type: MyPageCoordinator.self)},
            
            // App Setting Presentation
            { [weak self] in self?.assertComponentIsRegistered(type: AppSettingViewModel.self)},
            { [weak self] in self?.assertComponentIsRegistered(type: AppSettingViewController.self)},
            { [weak self] in self?.assertComponentIsRegistered(type: AppSettingCoordinator.self)}
        ]
        
        components.forEach { test_ComponentIsRegistered in
            test_ComponentIsRegistered()
        }
    }
    
    private func assertComponentIsRegistered<T: AnyObject>(
        type: T.Type
    ) {
        guard let _ = container.resolve(type) else {
            XCTFail("\(type) 주입 실패")
            return
        }
    }
}
