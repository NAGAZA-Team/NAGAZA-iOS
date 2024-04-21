//
//  DIContainerTests.swift
//  NagazaTests
//
//  Created by 전성훈 on 4/21/24.
//

import XCTest

@testable import Nagaza

final class DIContainerTests: XCTestCase {
    var register: DIRegister!
    var container: DIContainer!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        register = DIRegister.shared
        container = DIContainer.shared
        
        register.registerDIContainer()
    }

    override func tearDownWithError() throws {
        container.reset()
        
        try super.tearDownWithError()
    }
    
    // MARK: Repository Tests
    /// Home Repository
    func test_HomeRepositoryIsRegistered() {
        guard let homeRepository = container.resolve(HomeRepository.self) else {
            XCTFail("Home Repository 주입 실패")
            
            return
        }
    }
    
    // MARK: UseCase Tests
    /// Home Use Case
    func test_HomeUseCaseIsRegistered() {
        guard let homeUseCase = container.resolve(DefaultHomeUseCase.self) else {
            XCTFail("Home UseCase 주입 실패")
            
            return
        }
    }
    
    /// Region Setting Use Case
    func test_RegionSettingUseCaseIsRegistered() {
        guard let regionSettingUseCase = container.resolve(DefaultRegionSettingUseCase.self) else {
            XCTFail("Region Setting UseCase 주입 실패")
            
            return
        }
    }
    
    // MARK: Presentation Tests
    /// Splash View Controller
    func test_SplashViewControllerIsRegistered() {
        guard let splashViewController = container.resolve(SplashViewController.self) else {
            XCTFail("SplashViewController 주입 실패")
            
            return
        }
    }
    
    
}
