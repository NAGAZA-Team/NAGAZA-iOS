//
//  UserDefaultsRegionSettingStorageTests.swift
//  NagazaTests
//
//  Created by 전성훈 on 4/24/24.
//

import XCTest

@testable import Nagaza

final class UserDefaultsRegionSettingStorageTests: XCTestCase {

    var userDefaults: UserDefaults!
    var storage: UserDefaultsRegionSettingStorage!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        userDefaults = UserDefaults(suiteName: "testRegionSetting")
        userDefaults.removePersistentDomain(forName: "testRegionSetting")
        
        storage = UserDefaultsRegionSettingStorage(
            userDefaults: userDefaults,
            dispatchQueue: MockDispatchQueueType()
        )
    }

    override func tearDownWithError() throws {
        userDefaults.removePersistentDomain(forName: "testRegionSetting")
        userDefaults = nil
        storage = nil
        
        try super.tearDownWithError()
    }

    func test_초기값지역_불러오기() {
        // given
        // when
        var fetchedRegion: String?
        
        storage.fetchRegion { result in
            switch result {
            case .success(let region):
                fetchedRegion = region
            case .failure(_):
                XCTFail("초기값 지역 불러오기 실패")
            }
        }
        
        // then
        XCTAssertEqual(fetchedRegion, "전국 전체")
        XCTAssertEqual(userDefaults.string(forKey: "RegionSetting"), "전국 전체")
    }
    
    func test_지역_저장하기() {
        // given
        let newRegion = "서울"
        var resultRegion: String?
        
        userDefaults.set("전국 전체", forKey: "RegionSetting")
                
        // when
        storage.saveRegion(updatedRegion: newRegion) { result in
            switch result {
            case .success(let region):
                resultRegion = region
            case .failure(_):
                XCTFail("지역 저장하기 실패")
            }
        }
        
        // then
        XCTAssertEqual(resultRegion, newRegion)
        XCTAssertEqual(userDefaults.string(forKey: "RegionSetting"), resultRegion)
    }
}
