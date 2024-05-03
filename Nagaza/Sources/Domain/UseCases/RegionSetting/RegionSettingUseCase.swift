//
//  RegionSettingUseCase.swift
//  Nagaza
//
//  Created by 전성훈 on 4/24/24.
//

import Foundation

protocol RegionSettingUseCaseProtocol: AnyObject {
    func fetchRegion(
        completion: @escaping (Result<Region, Error>) -> Void
    )
    func fetchRegions(
        isRequestThemesCount: Bool,
        completion: @escaping (Result<Regions, Error>) -> Void
    )
    
    func saveRegion(
        newRegion: Region,
        completion: @escaping (Result<Region, Error>) -> Void
    )
}

final class RegionSettingUseCase {
    private let regionSettingRepository: RegionSettingRepositoryProtocol
    private let defaultRegion = Region(mainRegion: "전국", subRegion: "전국")
    
    init(regionSettingRepository: RegionSettingRepositoryProtocol) {
        self.regionSettingRepository = regionSettingRepository
    }
}

extension RegionSettingUseCase: RegionSettingUseCaseProtocol {
    func fetchRegion(
        completion: @escaping (Result<Region, Error>) -> Void
    ) {
        regionSettingRepository.fetchRegion(
            defaultRegion: defaultRegion,
            completion: completion
        )
    }
    
    func fetchRegions(
        isRequestThemesCount: Bool,
        completion: @escaping (Result<Regions, any Error>) -> Void
    ) {
        regionSettingRepository.fetchRegions(
            defaultRegion: defaultRegion, 
            isRequestThemesCount: isRequestThemesCount,
            completion: completion
        )
    }
    
    func saveRegion(
        newRegion: Region,
        completion: @escaping (Result<Region, any Error>) -> Void
    ) {
        regionSettingRepository.saveRegion(
            newRegion: newRegion,
            completion: completion
        )
    }
}
