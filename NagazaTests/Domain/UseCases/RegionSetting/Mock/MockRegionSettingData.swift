//
//  MockRegionSettingData.swift
//  Nagaza
//
//  Created by 전성훈 on 4/30/24.
//

import Foundation

@testable import Nagaza

let mockSubRegions: [SubRegion] = [
    SubRegion(region: "서울", themeCount: nil),
    SubRegion(region: "강남", themeCount: nil),
    SubRegion(region: "홍대", themeCount: nil)
]

let mockSubRegionsWithThemeCount: [SubRegion] = [
    SubRegion(region: "서울", themeCount: 100),
    SubRegion(region: "강남", themeCount: 200),
    SubRegion(region: "홍대", themeCount: 300)
]

let mockMainRegions: [MainRegion] = [
    MainRegion(
        region: "서울",
        subRegions: mockSubRegions,
        isSelected: true
    )
]

let mockMainRegionsWithThemeCount: [MainRegion] = [
    MainRegion(
        region: "서울",
        subRegions: mockSubRegionsWithThemeCount,
        isSelected: true
    )
]

let regions: Regions = Regions(mainRegion: mockMainRegions)
let regionsWithThemeCount: Regions = Regions(mainRegion: mockMainRegionsWithThemeCount)
let region: Region = Region(mainRegion: "서울", subRegion: "서울")
