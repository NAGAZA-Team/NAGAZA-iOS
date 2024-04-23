//
//  DefaultRegionSettingUseCase.swift
//  Nagaza
//
//  Created by 전성훈 on 2024/03/18.
//

import Foundation

protocol RegionSettingUseCaseProtocol: AnyObject {
    func loadMainRegions() -> [MainRegion]
    func loadSubRegions(with mainRegion: Region) -> [SubRegion]
    
    func loadSelectedRegion() -> String
}

final class DefaultRegionSettingUseCase: RegionSettingUseCaseProtocol {
    
    init() {
        
    }
    
    func loadMainRegions() -> [MainRegion] {
        return Region.allCases.map { MainRegion(region: $0, isSelected: $0.rawValue == 0)}
    }
    
    func loadSubRegions(with mainRegion: Region) -> [SubRegion] {
        return fetchSubRegionsThemeCount(with: mainRegion)
    }
    
    private func fetchSubRegionsThemeCount(with mainRegion: Region) -> [SubRegion] {
        return mainRegion.cities.map { SubRegion(region: $0, themeCount: 50) }
    }
    
    func loadSelectedRegion() -> String {
        return "전국 전체"
    }
}
