//
//  BaseTargetType.swift
//  Nagaza
//
//  Created by SeungMin on 2023/11/01.
//

import Foundation
import Moya

protocol BaseTargetType: TargetType { }

extension BaseTargetType {
    var baseURL: URL {
        return URL(string: "http://www.nagaza.xyz/")!
    }
    
    var headers: [String: String]? {
        if let accessToken = Keychain.shared.get(.accessToken) {
            return [
                "Authorization": "Bearer \(accessToken)",
                "Content-Type": "application/json",
            ]
        } else {
            return nil
        }
    }
}

extension Encodable {
    func toDictionary() -> [String: Any] {
        do {
            let data = try JSONEncoder().encode(self)
            let dic = try JSONSerialization.jsonObject(with: data, options: [.fragmentsAllowed]) as? [String: Any]
            
            return dic ?? [:]
        } catch {
            return [:]
        }
    }
}

