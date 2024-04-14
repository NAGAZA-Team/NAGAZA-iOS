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
    
    func resolve<T: AnyObject>(_ type: T.Type) -> T? {
        let key = String(describing: type)
        
        return dependencies[key]?.value as? T
    }
}
