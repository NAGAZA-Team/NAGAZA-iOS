//
//  MockRegionSettingRepository.swift
//  Nagaza
//
//  Created by 전성훈 on 4/30/24.
//

import Foundation

@testable import Nagaza

final class MockRegionSettingRepository: RegionSettingRepositoryProtocol {
    let mockRegion = region
    let mockRegions = regions
    let mockRegionsWithThemeCount = regionsWithThemeCount
    var isReturnError = false
    
    private func handleRequest<T>(
        error: Error,
        successData: T,
        completion: @escaping (Result<T, Error>) -> Void
    ) {
        if isReturnError {
            completion(.failure(error))
        } else {
            completion(.success(successData))
        }
    }
    
    func fetchRegion(
        defaultRegion: Region,
        completion: @escaping (Result<Region, Error>) -> Void
    ) {
        handleRequest(error: MockRepositoryError.failedFetcing, successData: mockRegion, completion: completion)
    }
    
    func fetchRegions(
        defaultRegion: Region,
        isRequestThemesCount: Bool,
        completion: @escaping (Result<Regions, Error>) -> Void
    ) {
        handleRequest(
            error: MockRepositoryError.failedFetcing,
            successData: isRequestThemesCount ? mockRegionsWithThemeCount : mockRegions,
            completion: completion
        )
    }
    
    func saveRegion(
        newRegion: Region,
        completion: @escaping (Result<Region, Error>) -> Void
    ) {
        handleRequest(error: MockRepositoryError.failedFetcing, successData: mockRegion, completion: completion)
    }
}
