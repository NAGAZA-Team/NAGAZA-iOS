//
//  HomeSectionType.swift
//  Nagaza
//
//  Created by 전성훈 on 4/23/24.
//

import Foundation

enum HomeSectionType: Int {
    case horror
    case fantasy
    case suspense
    case comic
    case drama
    case sf
    case rRtated
    
    var title: String {
        switch self {
        case .horror:
            return "공포 순"
        case .fantasy:
            return "판타지 순"
        case .suspense:
            return "스릴러 순"
        case .comic:
            return "코믹 순"
        case .drama:
            return "드라마 순"
        case .sf:
            return "공상과학 순"
        case .rRtated:
            return "별점 순"
        }
    }
}
