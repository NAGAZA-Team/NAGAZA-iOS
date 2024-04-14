//
//  DIRegister.swift
//  Nagaza
//
//  Created by 전성훈 on 4/9/24.
//

import Foundation

final class DIRegister {
    static let shared = DIRegister()
    
    private init() { }
    
    func registerDIContainer() {
        let container = DIContainer.shared
        
    }
}
