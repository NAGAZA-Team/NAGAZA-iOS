//
//  Regions.swift
//  Nagaza
//
//  Created by 전성훈 on 4/24/24.
//

import Foundation

struct Regions {
    let mainRegion: [MainRegion]
}

struct MainRegion {
    let region: String
    let subRegions: [SubRegion]
    var isSelected: Bool
}

struct SubRegion {
    let region: String
    var themeCount: Int?
}
