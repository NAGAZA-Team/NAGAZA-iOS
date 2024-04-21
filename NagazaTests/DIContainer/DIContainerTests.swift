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
    
    func test_HomeRepositoryIsRegistered() throws {
        let repository: HomeRepository? = container.resolve(HomeRepository.self)
        XCTAssertNotNil(repository, "home Repository 주입 실패")
    }
    
}
