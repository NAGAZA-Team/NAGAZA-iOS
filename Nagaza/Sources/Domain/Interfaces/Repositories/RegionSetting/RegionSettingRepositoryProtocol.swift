//
//  RegionSettingRepositoryProtocol.swift
//  Nagaza
//
//  Created by 전성훈 on 4/24/24.
//

import Foundation

protocol RegionSettingRepositoryProtocol {
    func fetchRegion(
        defaultRegion: Region,
        completion: @escaping (Result<Region, Error>) -> Void
    )
    func fetchRegionsNoThemeCount(
        defaultRegion: Region,
        completion: @escaping (Result<Regions, Error>) -> Void
    )
    func fetchRegionsThemeCount(
        defaultRegion: Region,
        completion: @escaping (Result<Regions, Error>) -> Void
    )

    func saveRegion(
        newRegion: Region,
        completion: @escaping (Result<Region, Error>) -> Void
    )
}
