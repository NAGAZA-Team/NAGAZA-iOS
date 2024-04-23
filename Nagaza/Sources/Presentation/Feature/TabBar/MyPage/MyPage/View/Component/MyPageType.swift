//
//  MyPageType.swift
//  Nagaza
//
//  Created by 전성훈 on 4/24/24.
//

import Foundation

enum MyPageRowType {
    case myReview
    case like
    case appSetting
    case inquiry
    
    var title: String {
        switch self {
        case .myReview:
            "내가 작성한 리뷰"
        case .like:
            "찜 목록"
        case .appSetting:
            "앱 설정"
        case .inquiry:
            "문의/제안하기"
        }
    }
}

enum MyPageSectionType {
    case myData
    case appSetting
    case inquiry
}
