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
    
    func test_AllComponentsAreRegistered() {
        // 테스트 코드에선 굳이 [weak self] 안 해도 괜찮음
        // 그렇지만 일관된 코드 작성을 위해 추가해봄
        let components: [() -> Void] = [
            { [weak self] in self?.assertComponentIsRegistered(type: HomeRepository.self)},
            { [weak self] in self?.assertComponentIsRegistered(type: DefaultHomeUseCase.self)},
            { [weak self] in self?.assertComponentIsRegistered(type: DefaultRegionSettingUseCase.self)},
            { [weak self] in self?.assertComponentIsRegistered(type: SplashViewController.self)},
            { [weak self] in self?.assertComponentIsRegistered(type: AppFlowCoordinator.self)},
            { [weak self] in self?.assertComponentIsRegistered(type: LoginFlowCoordinator.self)},
        ]
        
        components.forEach { test in
            test()
        }
    }
    
    private func assertComponentIsRegistered<T: AnyObject>(
        type: T.Type,
        file: StaticString = #file,
        line: UInt = #line
    ) {
        guard let _ = container.resolve(type) else {
            XCTFail("\(type) 주입 실패", file: file, line: line)
            return
        }
    }
}
