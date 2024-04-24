//
//  RegionSettingStorage.swift
//  Nagaza
//
//  Created by 전성훈 on 4/24/24.
//

import Foundation

protocol RegionSettingStorage {
    func fetchRegion(completion: @escaping (Result<String, Error>) -> Void)
    func saveRegion(updatedRegion: String, completion: @escaping (Result<String, Error>) -> Void)
}
