//
//  UserDefaultsRegionSettingStorage.swift
//  Nagaza
//
//  Created by 전성훈 on 4/24/24.
//

import Foundation

final class UserDefaultsRegionSettingStorage {
    
    private let regionKey = "RegionSetting"
    private var userDefaults: UserDefaults
    private let dispatchQueue: DispatchQueueType
    
    init(
        userDefaults: UserDefaults = UserDefaults.standard,
        dispatchQueue: DispatchQueueType = DispatchQueue.global(qos: .userInitiated)
    ) {
        self.userDefaults = userDefaults
        self.dispatchQueue = dispatchQueue
    }
    
    private func fetchRegionValue() -> String {
        if let result = userDefaults.string(forKey: regionKey) {
            return result
        } else {
            let defaultRegion = "전국 전체"
            
            saveRegion(region: defaultRegion)
            return defaultRegion
        }
    }
    
    private func saveRegion(region: String) {
        userDefaults.set(region, forKey: regionKey)
    }
}

extension UserDefaultsRegionSettingStorage: RegionSettingStorage {
    func fetchRegion(completion: @escaping (Result<String, any Error>) -> Void) {
        dispatchQueue.async { [weak self] in
            guard let self = self else { return }
            
            let region = self.fetchRegionValue()
            
            completion(.success(region))
        }
    }
    
    func saveRegion(
        updatedRegion: String,
        completion: @escaping (Result<String, any Error>) -> Void
    ) {
        dispatchQueue.async { [weak self] in
            guard let self = self else { return }
            
            let existingRegion = self.fetchRegionValue()
            
            if existingRegion != updatedRegion {
                self.saveRegion(region: updatedRegion)
            }
            
            completion(.success(updatedRegion))
        }
    }
}
