//
//  MypageInfo.swift
//  Nagaza
//
//  Created by 강조은 on 3/10/24.
//

import Foundation

enum MyPageInfoSection: Hashable {
    case myData([MyPageInfo])
    case appSetting([MyPageInfo])
    case inquiry([MyPageInfo])
    
    var list: [MyPageInfo] {
        switch self {
        case .myData(let list), .appSetting(let list), .inquiry(let list):
            return list
        }
    }
}

struct MyPageInfo: Hashable {
    let identifier = UUID()
    let title: String
    var count: Int? = nil
}

extension MyPageInfo {
    public static func == (lhs: MyPageInfo, rhs: MyPageInfo) -> Bool {
        lhs.identifier == rhs.identifier
    }
}
