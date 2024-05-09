//
//  RegionSettingRepository.swift
//  Nagaza
//
//  Created by 전성훈 on 4/24/24.
//

import Foundation

import Moya

final class RegionSettingRepository {
    typealias Target = RegionSettingTarget
    private var regionSettingStorage: RegionSettingStorageProtocol
    var provider: MoyaProvider<Target>?
    
    
    init(regionSettingStorage: RegionSettingStorageProtocol) {
        self.regionSettingStorage = regionSettingStorage
        
        self.provider = consProvider(true, 200, nil)
    }
}

extension RegionSettingRepository: RegionSettingRepositoryProtocol {
    func fetchRegion(
        defaultRegion: Region,
        completion: @escaping (Result<Region, Error>) -> Void
    ) {
        regionSettingStorage.fetchRegion { [weak self] result in
            switch result {
            case .success(let region):
                completion(.success(region))
            case .failure:
                self?.saveRegion(newRegion: defaultRegion, completion: { result in
                    switch result {
                    case .success(let region):
                        completion(.success(region))
                    case .failure(let error):
                        completion(.failure(error))
                    }
                })
            }
        }
    }
    
    func fetchRegions(
        defaultRegion: Region,
        isRequestThemesCount: Bool,
        completion: @escaping (Result<Regions, Error>) -> Void
    ) {
        regionSettingStorage.fetchRegion { [weak self] result in
            switch result {
            case .success(let region):
                self?.fetchRegions(
                    region: region,
                    isRequestThemesCount: isRequestThemesCount,
                    completion: completion
                )
            case .failure(_):
                self?.saveRegion(newRegion: defaultRegion, completion: { result in
                    switch result {
                    case .success(let region):
                        self?.fetchRegions(
                            region: region,
                            isRequestThemesCount: isRequestThemesCount,
                            completion: completion
                        )
                    case .failure(let error):
                        completion(.failure(error))
                    }
                })
            }
        }
    }
        
    func saveRegion(
        newRegion: Region,
        completion: @escaping (Result<Region, Error>) -> Void
    ) {
        regionSettingStorage.saveRegion(updatedRegion: newRegion, completion: completion)
    }
}

extension RegionSettingRepository: ProviderProtocol {
    func consProvider(
        _ isStub: Bool,
        _ sampleStatusCode: Int,
        _ customendpointClosure: ((RegionSettingTarget) -> Moya.Endpoint)?
    ) {
        
    }
    
    private func fetchRegions(
        region: Region,
        isRequestThemesCount: Bool,
        completion: @escaping (Result<Regions, Error>) -> Void
    ) {
        if isRequestThemesCount {
            request(
                RegionsResponse.self,
                target: .fetchRegionsThemeCount
            ) { result in
                switch result {
                case .success(let regions):
                    let regions = regions.toDomain(with: region.mainRegion)
                    
                    completion(.success(regions))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        } else {
            let regions = region.toRegions()
            
            completion(.success(regions))
        }
    }
}
