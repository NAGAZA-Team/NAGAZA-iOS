//
//  UserDefaultsRegionSettingStorage.swift
//  Nagaza
//
//  Created by 전성훈 on 4/24/24.
//

import Foundation

final class UserDefaultsRegionSettingStorage {
    
    private let regionKey: String
    private let userDefaults: UserDefaults
    private let dispatchQueue: DispatchQueueType
    
    init(
        regionKey: String = "RegionSetting",
        userDefaults: UserDefaults = UserDefaults.standard,
        dispatchQueue: DispatchQueueType = DispatchQueue.global(qos: .userInitiated)
    ) {
        self.regionKey = regionKey
        self.userDefaults = userDefaults
        self.dispatchQueue = dispatchQueue
    }
    
    private func fetchRegionValue() throws -> Region {
        guard let result = userDefaults.object(forKey: regionKey) as? Data,
              let regionComposite = try? JSONDecoder().decode(RegionUDS.self, from: result) else {
            throw StorageError.dataNotFound
        }
        
        return regionComposite.toDomain()
    }
    
    private func saveRegion(region: Region) throws {
        let regionUSD = RegionUDS(regionTitle: region)
        
        guard let encoded = try? JSONEncoder().encode(regionUSD) else {
            throw StorageError.unableToSave
        }
        
        userDefaults.set(encoded, forKey: regionKey)
    }
}

extension UserDefaultsRegionSettingStorage: RegionSettingStorageProtocol {
    func fetchRegion(completion: @escaping (Result<Region, Error>) -> Void) {
        dispatchQueue.async { [weak self] in
            guard let self = self else { return }
            
            do {
                let region = try self.fetchRegionValue()
                completion(.success(region))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    func saveRegion(
        updatedRegion: Region,
        completion: @escaping (Result<Region, Error>) -> Void
    ) {
        dispatchQueue.async { [weak self] in
            guard let self = self else { return }
            
            do {
                try self.saveRegion(region: updatedRegion)
                completion(.success(updatedRegion))
            } catch {
                completion(.failure(error))
            }
        }
    }
}
