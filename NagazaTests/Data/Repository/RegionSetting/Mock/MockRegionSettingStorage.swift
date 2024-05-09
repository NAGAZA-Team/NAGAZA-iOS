//
//  MockRegionSettingStorage.swift
//  Nagaza
//
//  Created by 전성훈 on 4/30/24.
//

import Foundation

@testable import Nagaza

final class MockRegionSettingStorage: RegionSettingStorageProtocol {
    
    var mockFetchRegionResult: Result<Region, Error>? = nil
    var mockSaveRegionResult: Result<Region,Error>? = nil
    
    func fetchRegion(
        completion: @escaping (Result<Region, Error>) -> Void
    ) {
        if let result = mockFetchRegionResult {
            completion(result)
        }
    }
    
    func saveRegion(
        updatedRegion: Region,
        completion: @escaping (Result<Region, Error>) -> Void
    ) {
        if let result = mockSaveRegionResult {
            completion(result)
        }
    }
}
