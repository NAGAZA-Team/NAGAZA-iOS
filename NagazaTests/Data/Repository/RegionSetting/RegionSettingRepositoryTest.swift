//
//  RegionSettingRepositoryTest.swift
//  NagazaTests
//
//  Created by 전성훈 on 4/24/24.
//

import XCTest

@testable import Nagaza

final class RegionSettingRepositoryTest: XCTestCase {
    var storage: MockRegionSettingStorage!
    var repository: RegionSettingRepository!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        storage = MockRegionSettingStorage()
        repository = RegionSettingRepository(regionSettingStorage: storage)
    }

    override func tearDownWithError() throws {
        storage = nil
        repository = nil
        
        try super.tearDownWithError()
    }

    // MARK: 최초 지역값 저장이 없을 때 지역 값 불러오기
    func test_최초_지역값_저장이없을때_지역값_불러오기() {
        // given
        let defaultRegion = Region(mainRegion: "전국", subRegion: "전국")
        storage.mockFetchRegionResult = .failure(MockStorageError.failedFetcing)
        storage.mockSaveRegionResult = .success(defaultRegion)
        
        var resultRegion: Region?
        
        // when
        repository.fetchRegion(defaultRegion: defaultRegion) { result in
            switch result {
            case .success(let region):
                resultRegion = region
            case .failure(let error):
                XCTFail("error: \(error)")
            }
        }
        
        // then
        XCTAssertEqual(defaultRegion, resultRegion)
    }
    
    // MARK: 저장된 지역 값 불러오기
    func test_저장된_지역값_불러오기() {
        // given
        let defaultRegion = Region(mainRegion: "전국", subRegion: "전국")
        let savedRegion = Region(mainRegion: "서울", subRegion: "강남")
        storage.mockFetchRegionResult = .success(savedRegion)
        
        var resultRegion: Region?
        
        // when
        repository.fetchRegion(defaultRegion: defaultRegion) { result in
            switch result {
            case .success(let region):
                resultRegion = region
            case .failure(let error):
                XCTFail("error: \(error)")
            }
        }
        
        // then
        XCTAssertEqual(savedRegion, resultRegion)
    }
    
    // MARK: 지역 값 성공적으로 저장하기
    func test_지역값_성공적으로_저장하기() {
        // given
        let savingRegion = Region(mainRegion: "서울", subRegion: "강남")
        storage.mockSaveRegionResult = .success(savingRegion)
        
        var resultRegion: Region?
        
        // when
        repository.saveRegion(newRegion: savingRegion) { result in
            switch result {
            case .success(let region):
                resultRegion = region
            case .failure(let error):
                XCTFail("error: \(error)")
            }
        }
        
        // then
        XCTAssertEqual(savingRegion, resultRegion)
    }
    
    // MARK: 테마 개수 없이 모든 지역 불러오기
    func test_테마개수_없이_모든지역_불러오기() {
        // given
        let defaultRegion = Region(mainRegion: "전국", subRegion: "전국")
        storage.mockFetchRegionResult = .success(defaultRegion)
        
        var resultRegions: Regions?
        
        // when
        repository.fetchRegions(
            defaultRegion: defaultRegion,
            isRequestThemesCount: false
        ) { result in
            switch result {
            case .success(let regions):
                resultRegions = regions
            case .failure(let error):
                XCTFail("error: \(error)")
            }
        }
        
        // then
        XCTAssertNil(resultRegions?.mainRegion.first?.subRegions.first?.themeCount)
    }
    
    // MARK: 테마 개수 추가된 모든 지역 불러오기
    // TODO: 실제 네트워크 연결 시 비동기처리로 변경 필요
    func test_테마개수_추가된_모든지역_불러오기() {
        // given
        let defaultRegion = Region(mainRegion: "전국", subRegion: "전국")
        storage.mockFetchRegionResult = .success(defaultRegion)
        
        var resultRegions: Regions?
        
        // when
        repository.fetchRegions(
            defaultRegion: defaultRegion,
            isRequestThemesCount: true
        ) { result in
            switch result {
            case .success(let regions):
                resultRegions = regions
            case .failure(let error):
                XCTFail("error: \(error)")
            }
        }
        
        // then
        XCTAssertNotNil(resultRegions?.mainRegion.first?.subRegions.first?.themeCount)
    }
    
    // MARK: 최초 지역 값이 없을 때 테마 개수가 없는 모든 지역 불러오기
    func test_최초지역값이_없을때_테마개수가_없는_모든지역_불러오기() {
        // given
        let defaultRegion = Region(mainRegion: "전국", subRegion: "전국")
        storage.mockFetchRegionResult = .failure(MockStorageError.failedFetcing)
        storage.mockSaveRegionResult = .success(defaultRegion)
        
        var resultRegions: Regions?
        
        // when
        repository.fetchRegions(
            defaultRegion: defaultRegion,
            isRequestThemesCount: false
        ) { result in
            switch result {
            case .success(let regions):
                resultRegions = regions
            case .failure(let error):
                XCTFail("error: \(error)")
            }
        }
        
        // then
        XCTAssertNil(resultRegions?.mainRegion.first?.subRegions.first?.themeCount)
    }
    
    // MARK: 최초 지역 값이 없을 때 테마 개수가 있는 모든 지역 불러오기
    func test_최초지역값이_없을때_테마개수가_있는_모든지역_불러오기() {
        // given
        let defaultRegion = Region(mainRegion: "전국", subRegion: "전국")
        storage.mockFetchRegionResult = .failure(MockStorageError.failedFetcing)
        storage.mockSaveRegionResult = .success(defaultRegion)
        
        var resultRegions: Regions?
        
        // when
        repository.fetchRegions(
            defaultRegion: defaultRegion,
            isRequestThemesCount: true
        ) { result in
            switch result {
            case .success(let regions):
                resultRegions = regions
            case .failure(let error):
                XCTFail("error: \(error)")
            }
        }
        
        // then
        XCTAssertNotNil(resultRegions?.mainRegion.first?.subRegions.first?.themeCount)
    }
}
