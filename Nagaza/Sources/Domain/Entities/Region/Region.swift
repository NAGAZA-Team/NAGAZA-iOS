//
//  RegionTitle.swift
//  Nagaza
//
//  Created by 전성훈 on 4/24/24.
//

import Foundation

struct Region: Equatable {
    let mainRegion: String
    let subRegion: String
    
    static func == (lhs: Region, rhs: Region) -> Bool {
        return lhs.mainRegion == rhs.mainRegion && lhs.subRegion == rhs.subRegion
    }
}

extension Region {
    func toRegions() -> Regions {
        let allRegions = RegionType.allCases.map { regionType -> MainRegion in
            
            let subRegions = regionType.cities.map {
                SubRegion(region: $0, themeCount: nil)
            }
            
            return MainRegion(
                region: regionType.title,
                subRegions: subRegions,
                isSelected: regionType.title == self.mainRegion
            )
        }
        
        return Regions(mainRegion: allRegions)
    }
}
