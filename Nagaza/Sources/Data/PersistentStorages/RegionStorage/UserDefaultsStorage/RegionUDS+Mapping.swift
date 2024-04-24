//
//  RegionUDS+Mapping.swift
//  Nagaza
//
//  Created by 전성훈 on 4/24/24.
//

import Foundation

struct RegionUDS: Codable, Equatable {
    let mainRegion: String
    let subRegion: String
    
    init(regionTitle: Region) {
        mainRegion = regionTitle.mainRegion
        subRegion = regionTitle.subRegion
    }
    
    static func == (lhs: RegionUDS, rhs: RegionUDS) -> Bool {
        return lhs.mainRegion == rhs.mainRegion && lhs.subRegion == rhs.subRegion
    }
}

extension RegionUDS {
    func toDomain() -> Region {
        return .init(mainRegion: mainRegion, subRegion: subRegion)
    }
}
