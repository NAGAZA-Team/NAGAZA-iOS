//
//  Regions.swift
//  Nagaza
//
//  Created by 전성훈 on 4/24/24.
//

import Foundation

struct Regions: Equatable {
    let mainRegion: [MainRegion]
    
    static func == (lhs: Regions, rhs: Regions) -> Bool {
        return lhs.mainRegion == rhs.mainRegion
    }
}

struct MainRegion: Equatable {
    let region: String
    let subRegions: [SubRegion]
    var isSelected: Bool
}

struct SubRegion: Equatable {
    let region: String
    var themeCount: Int?
}
