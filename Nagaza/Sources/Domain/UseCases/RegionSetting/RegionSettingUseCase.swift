//
//  RegionSettingUseCase.swift
//  Nagaza
//
//  Created by 전성훈 on 4/24/24.
//

import Foundation

protocol RegionSettingUseCaseProtocol: AnyObject {
    func fetchRegion(completion: @escaping (Result<Region, Error>) -> Void)
    func fetchRegionsNoThemeCount(completion: @escaping (Result<Regions, Error>) -> Void)
    func fetchRegionsThemeCount(completion: @escaping (Result<Regions, Error>) -> Void)
    
    func saveRegion(newRegion: Region, completion: @escaping (Result<Region, Error>) -> Void)
}

final class RegionSettingUseCase {
    private let regionSettingRepository: RegionSettingRepositoryProtocol
    private let defaultRegion = Region(mainRegion: "전국", subRegion: "전국")

    
    init(regionSettingRepository: RegionSettingRepositoryProtocol) {
        self.regionSettingRepository = regionSettingRepository
    }
}

extension RegionSettingUseCase: RegionSettingUseCaseProtocol {
    func fetchRegion(completion: @escaping (Result<Region, Error>) -> Void) {
        regionSettingRepository.fetchRegion(defaultRegion: defaultRegion, completion: completion)
    }
    
    func fetchRegionsNoThemeCount(completion: @escaping (Result<Regions, Error>) -> Void) {
        regionSettingRepository.fetchRegionsNoThemeCount(defaultRegion: defaultRegion, completion: completion)
    }
    
    func fetchRegionsThemeCount(completion: @escaping (Result<Regions, Error>) -> Void) {
        regionSettingRepository.fetchRegionsThemeCount(defaultRegion: defaultRegion, completion: completion)
    }
    
    func saveRegion(newRegion: Region, completion: @escaping (Result<Region, any Error>) -> Void) {
        regionSettingRepository.saveRegion(newRegion: newRegion, completion: completion)
    }
}
