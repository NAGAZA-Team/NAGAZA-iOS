//
//  Networkable.swift
//  Nagaza
//
//  Created by SeungMin on 2023/11/01.
//

import Moya

protocol Networkable {
    
    // TargetType을 준수하는 Generic Type
    associatedtype Target: TargetType
    
    // DIP를 위해 protocol에 provider객체를 만드는 함수 정의
    static func makeProvider() -> MoyaProvider<Target>
}

extension Networkable {
    
    static func makeProvider() -> MoyaProvider<Target> {
        
        let loggerPlugin = NetworkLoggerPlugin()
        return MoyaProvider<Target>(plugins: [loggerPlugin])
    }
    
    static var provider: MoyaProvider<Target> {
        makeProvider()
    }
}


