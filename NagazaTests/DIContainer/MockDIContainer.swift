//
//  DIContainerMock.swift
//  Nagaza
//
//  Created by 전성훈 on 4/22/24.
//

import Foundation

final class MockDIContainer: DIContainerProtocol {
    static private let shared = MockDIContainer()
    
    private var dependencies: [String: AnyObject] = [:]
    
    private init() { }
    
    static func sharedContainer() -> DIContainerProtocol {
        return shared
    }
    
    func register<T>(_ type: T.Type, dependency: T) where T : AnyObject {
        let key = String(describing: type)
        dependencies[key] = dependency
    }
    
    func resolve<T>(_ type: T.Type) -> T? {
        let key = String(describing: type)
        
        guard let value = dependencies[key] as? T else {
            print("---- 의존성 Key 값을 찾지 못했습니다!!: \(key) ----")
            
            return nil
        }
        
        return value
    }
    
    func unregister(_ type: AnyObject.Type) {
        let key = String(describing: type)
        dependencies.removeValue(forKey: key)
    }
    
    func reset() {
        dependencies = [:]
    }
}
