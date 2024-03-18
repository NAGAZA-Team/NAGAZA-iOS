//
//  DefaultRegionSettingUseCase.swift
//  Nagaza
//
//  Created by 전성훈 on 2024/03/18.
//

import Foundation

protocol RegionSettingUseCase {
    func loadMainRegions(with subRegion: String) -> [MainRegion]
    func loadSubRegions(with mainRegion: Region) -> [SubRegion]
}

final class DefaultRegionSettingUseCase: RegionSettingUseCase {
    
    init() {
        
    }
    
    func loadMainRegions(with subRegion: String = "전국 전체") -> [MainRegion] {
        return Region.allCases.map { MainRegion(region: $0, isSelected: $0.rawValue == 1)}
    }
    
    func loadSubRegions(with mainRegion: Region) -> [SubRegion] {
        return fetchSubRegionsThemeCount(with: mainRegion)
    }
    
    private func fetchSubRegionsThemeCount(with mainRegion: Region) -> [SubRegion] {
        return mainRegion.cities.map { SubRegion(region: $0, themeCount: 50) }
    }
}
