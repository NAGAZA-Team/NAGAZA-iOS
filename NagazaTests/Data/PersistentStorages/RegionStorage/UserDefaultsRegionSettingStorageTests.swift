//
//  UserDefaultsRegionSettingStorageTests.swift
//  NagazaTests
//
//  Created by 전성훈 on 4/24/24.
//

import XCTest

@testable import Nagaza

final class UserDefaultsRegionSettingStorageTests: XCTestCase {
    
    let testSuiteName = "testRegionSetting"
    let testUserDefaultKey = "testRegionSetting"

    var userDefaults: UserDefaults!
    var storage: UserDefaultsRegionSettingStorage!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        userDefaults = UserDefaults(suiteName: testSuiteName)
        userDefaults.removePersistentDomain(forName: testSuiteName)
        
        storage = UserDefaultsRegionSettingStorage(
            regionKey: testUserDefaultKey,
            userDefaults: userDefaults,
            dispatchQueue: MockDispatchQueueType()
        )
    }

    override func tearDownWithError() throws {
        userDefaults.removePersistentDomain(forName: testSuiteName)
        userDefaults = nil
        storage = nil
        
        try super.tearDownWithError()
    }
    
    func test_지역_저장하기() {
        // given
        let defaultRegionTitle = Region(mainRegion: "전국", subRegion: "전국")
        let defaultRegionTitleUDS = RegionUDS(regionTitle: defaultRegionTitle)
        
        var resultRegionTitle: Region?
        var savedRegionTitleUDS: RegionUDS?
        
        // when
        storage.saveRegion(updatedRegion: defaultRegionTitle) { result in
            switch result {
            case .success(let region):
                resultRegionTitle = region
            case .failure(_):
                XCTFail("지역 저장하기 실패")
            }
        }
        
        if let result = userDefaults.object(forKey: testUserDefaultKey) as? Data,
           let regionTitleUDS = try? JSONDecoder().decode(RegionUDS.self, from: result) {
            savedRegionTitleUDS = regionTitleUDS
        }
        
        // then
        XCTAssertEqual(resultRegionTitle, defaultRegionTitle)
        XCTAssertEqual(savedRegionTitleUDS, defaultRegionTitleUDS)
    }
    
    func test_지역_저장된값_불러오기() {
        // given
        let defaultRegionTitle = Region(mainRegion: "전국", subRegion: "전국")
        let defaultRegionTitleUDS = RegionUDS(regionTitle: defaultRegionTitle)
        
        var resultRegionTitle: Region?
        
        if let encoded = try? JSONEncoder().encode(defaultRegionTitleUDS) {
            userDefaults.set(encoded, forKey: testUserDefaultKey)
        }
        
        // when
        storage.fetchRegion { result in
            switch result {
            case .success(let region):
                resultRegionTitle = region
            case .failure(_):
                XCTFail("초기값 지역 불러오기 실패")
            }
        }
        
        // then
        XCTAssertEqual(resultRegionTitle, defaultRegionTitle)
    }
    
    func test_초기값이_없을때_에러() {
        // given
        
        // when
        storage.fetchRegion { result in
            // then
            switch result {
            case .success(let region):
                XCTFail("초기값이 있으면 앙대요")
            case .failure(let error as StorageError):
                XCTAssertEqual(error, StorageError.dataNotFound)
            case .failure(let error):
                XCTFail("다른 에러 발생..!!\(error)")
            }
        }
    }
}
