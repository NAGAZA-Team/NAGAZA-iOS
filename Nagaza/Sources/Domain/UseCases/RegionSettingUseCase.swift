//
//  RegionSettingUseCase.swift
//  Nagaza
//
//  Created by 전성훈 on 2024/03/18.
//

import Foundation

final class RegionSettingUseCase {
    
    init() {
        
    }
    
    func loadMainRegions(with isSelectedIndex: Int = 0) -> [MainRegion] {
        return Region.allCases.map { MainRegion(region: $0, isSelected: $0.rawValue == isSelectedIndex)}
    }
    
    func loadSubRegions(with mainRegion: Region) -> [SubRegion] {
        return fetchSubRegionsThemeCount(with: mainRegion)
    }
    
    private func fetchSubRegionsThemeCount(with mainRegion: Region) -> [SubRegion] {
        return mainRegion.cities.map { SubRegion(region: $0, themeCount: 50) }
    }
}
