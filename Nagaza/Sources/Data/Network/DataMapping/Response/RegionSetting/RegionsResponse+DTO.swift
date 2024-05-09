//
//  RegionsResponse+DTO.swift
//  Nagaza
//
//  Created by 전성훈 on 4/30/24.
//

import Foundation

struct RegionsResponse: Decodable {
    let regions: [RegionResponse]
}

struct RegionResponse: Decodable {
    let mainRegion: String
    let subRegions: [SubRegionResponse]
}

struct SubRegionResponse: Decodable {
    let region: String
    let themeCount: Int
}

extension RegionsResponse {
    func toDomain(with compareRegion: String) -> Regions {
        let mainRegion = regions.map { $0.toDomain(with: compareRegion) }
        
        return Regions(mainRegion: mainRegion)
    }
}

extension RegionResponse {
    func toDomain(with compareRegion: String) -> MainRegion {
        let subRegions = subRegions.map { $0.toDomain() }
        
        return MainRegion(region: mainRegion, subRegions: subRegions, isSelected: compareRegion == mainRegion)
    }
}

extension SubRegionResponse {
    func toDomain() -> SubRegion {
        return SubRegion(region: region, themeCount: themeCount)
    }
}
