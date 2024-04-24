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
    
    func test_도메인_레포_등록확인() {
        // 테스트 코드에선 굳이 [weak self] 안 해도 괜찮음
        // 그렇지만 일관된 코드 작성을 위해 추가해봄
        let components: [() -> Void] = [
            // MARK: - Repository
            { [weak self] in self?.assertComponentIsRegistered(type: HomeRepository.self)},
            { [weak self] in self?.assertComponentIsRegistered(type: MapSearchRepository.self)},
            
            // MARK: - Use Case
            { [weak self] in self?.assertComponentIsRegistered(type: DefaultHomeUseCase.self)},
            { [weak self] in self?.assertComponentIsRegistered(type: RegionSettingUseCase.self)},
            { [weak self] in self?.assertComponentIsRegistered(type: DefaultMapSearchUseCase.self)}
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
