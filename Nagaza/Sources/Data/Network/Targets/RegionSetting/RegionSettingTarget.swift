//
//  RegionSettingTarget.swift
//  Nagaza
//
//  Created by 전성훈 on 4/30/24.
//

import Moya

enum RegionSettingTarget {
    case fetchRegionsThemeCount
}

extension RegionSettingTarget: BaseTargetType {
    var path: String {
        switch self {
        case .fetchRegionsThemeCount:
            return "v1/regions/count"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .fetchRegionsThemeCount:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .fetchRegionsThemeCount:
            return .requestPlain
        }
    }
    
}
