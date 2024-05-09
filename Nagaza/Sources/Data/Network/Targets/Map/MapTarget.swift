//
//  MapTarget.swift
//  Nagaza
//
//  Created by SeungMin on 3/14/24.
//

import Moya

enum MapTarget {
    case fetchRecentKeywordList
}

extension MapTarget: BaseTargetType {
    var path: String {
        switch self {
        case .fetchRecentKeywordList:
            return "v1/search/keyword"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .fetchRecentKeywordList:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .fetchRecentKeywordList:
            return .requestPlain
        }
    }
}

