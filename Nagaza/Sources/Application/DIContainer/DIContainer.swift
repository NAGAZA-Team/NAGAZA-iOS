//
//  DIContainer.swift
//  Nagaza
//
//  Created by 전성훈 on 4/9/24.
//

import Foundation

protocol DIContainerProtocol {
    static func sharedContainer() -> DIContainerProtocol
    
    func register<T: AnyObject>(_ type: T.Type, dependency: T)
    func resolve<T: AnyObject>(_ type: T.Type) -> T?
    func unregister(_ type: AnyObject.Type)
    
    func reset()
}

final class DIContainer: DIContainerProtocol {
    static func sharedContainer() -> DIContainerProtocol {
        return shared
    }
    
    static private let shared = DIContainer()

    private var dependencies: [String: AnyObject] = [:]

    private init() { }
        
    func register<T: AnyObject>(_ type: T.Type, dependency: T) {
        let key = String(describing: type)
        dependencies[key] = dependency
    }
    
    func resolve<T: AnyObject>(_ type: T.Type) -> T? {
        let key = String(describing: type)
        
        guard let value = dependencies[key] as? T else {
            print("---- 의존성 Key 값을 찾지 못했습니다!!: \(key) ----")
            return nil
        }
        
        return value
    }
    
    func unregister(_ type: AnyObject.Type) {
        let key = String(describing: type)
        print("key : ", key, " value: ", dependencies[key])
        dependencies.removeValue(forKey: key)
        print(dependencies.count)

    }
    
    func reset() {
        dependencies = [:]
    }
}
