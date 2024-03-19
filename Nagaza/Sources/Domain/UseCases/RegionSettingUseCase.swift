//
//  DefaultRegionSettingUseCase.swift
//  Nagaza
//
//  Created by 전성훈 on 2024/03/18.
//

import Foundation

protocol RegionSettingUseCase {
    func loadMainRegions() -> [MainRegion]
    func loadMainRegions(with subRegion: String) -> [MainRegion]
    func loadSubRegions(with mainRegion: Region) -> [SubRegion]
}

final class DefaultRegionSettingUseCase: RegionSettingUseCase {
    
    init() {
        
    }
    
    func loadMainRegions() -> [MainRegion] {
        return Region.allCases.map { MainRegion(region: $0, isSelected: $0.rawValue == 0)}
    }
    
    func loadMainRegions(with subRegion: String) -> [MainRegion] {
        return Region.allCases.map { region in
            let isSelected = region.cities.contains(subRegion)
            
            return MainRegion(region: region, isSelected: isSelected)
        }
    }
    
    func loadSubRegions(with mainRegion: Region) -> [SubRegion] {
        return fetchSubRegionsThemeCount(with: mainRegion)
    }
    
    private func fetchSubRegionsThemeCount(with mainRegion: Region) -> [SubRegion] {
        return mainRegion.cities.map { SubRegion(region: $0, themeCount: 50) }
    }
}
