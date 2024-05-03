//
//  MockRegionSettingUseCase.swift
//  Nagaza
//
//  Created by 전성훈 on 5/3/24.
//

import Foundation

@testable import Nagaza

final class MockRegionSettingUseCase: RegionSettingUseCaseProtocol {
    
    var mockFetchRegionResult: Result<Region, Error>? = nil
    var mockFetchRegionsResult: Result<Regions, Error>? = nil
    var mockSaveRegion: Result<Region, Error>? = nil
    
    func fetchRegion(
        completion: @escaping (Result<Region, Error>) -> Void
    ) {
        if let result = mockFetchRegionResult {
            completion(result)
        }
    }
    
    func fetchRegions(
        isRequestThemesCount: Bool,
        completion: @escaping (Result<Regions, Error>) -> Void
    ) {
        if let result = mockFetchRegionsResult {
            completion(result)
        }
    }
    
    func saveRegion(
        newRegion: Region,
        completion: @escaping (Result<Region, Error>) -> Void
    ) {
        if let result = mockSaveRegion {
            completion(result)
        }
    }
}
