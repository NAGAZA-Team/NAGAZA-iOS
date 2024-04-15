//
//  DIContainer.swift
//  Nagaza
//
//  Created by 전성훈 on 4/9/24.
//

import Foundation

final class DIContainer {
    static let shared = DIContainer()
    
    private init() { }
    
    private var dependencies: [String: Weak<AnyObject>] = [:]
    
    func register<T: AnyObject>(_ type: T.Type, dependency: T) {
        let key = String(describing: type)
        dependencies[key] = Weak(value: dependency)
    }
    
    func resolve<T: AnyObject>(_ type: T.Type) -> T {
        let key = String(describing: type)
        
        guard let value = dependencies[key]?.value as? T else {
            fatalError("---- 의존성 Key 값을 찾지 못했습니다!!: \(key) ----")
        }
        return value
    }
}
