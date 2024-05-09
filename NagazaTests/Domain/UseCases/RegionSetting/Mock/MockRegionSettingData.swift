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

let mockSubRegions2: [SubRegion] = [
    SubRegion(region: "화성", themeCount: nil),
    SubRegion(region: "안산", themeCount: nil),
    SubRegion(region: "수원", themeCount: nil)
]

let mockSubRegionsWithThemeCount: [SubRegion] = [
    SubRegion(region: "서울", themeCount: 100),
    SubRegion(region: "강남", themeCount: 200),
    SubRegion(region: "홍대", themeCount: 300)
]

let mockSubRegionsWithThemeCount2: [SubRegion] = [
    SubRegion(region: "화성", themeCount: 100),
    SubRegion(region: "안산", themeCount: 200),
    SubRegion(region: "수원", themeCount: 300)
]

let mockMainRegions: [MainRegion] = [
    MainRegion(
        region: "서울",
        subRegions: mockSubRegions,
        isSelected: true
    ),
    MainRegion(
        region: "경기도",
        subRegions: mockSubRegions2,
        isSelected: false
    )
]

let mockMainRegionsWithThemeCount: [MainRegion] = [
    MainRegion(
        region: "서울",
        subRegions: mockSubRegionsWithThemeCount,
        isSelected: true
    ),
    MainRegion(
        region: "경기도",
        subRegions: mockSubRegionsWithThemeCount2,
        isSelected: false
    )
]

let mockRegions: Regions = Regions(mainRegion: mockMainRegions)
let mockRegionsWithThemeCount: Regions = Regions(mainRegion: mockMainRegionsWithThemeCount)
let mockRegion: Region = Region(mainRegion: "서울", subRegion: "서울")
