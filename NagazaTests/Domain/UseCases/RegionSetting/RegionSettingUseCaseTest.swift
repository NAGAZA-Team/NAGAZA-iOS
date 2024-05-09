//
//  RegionSettingUseCaseTest.swift
//  NagazaTests
//
//  Created by 전성훈 on 4/24/24.
//

import XCTest

@testable import Nagaza

final class RegionSettingUseCaseTest: XCTestCase {
    private var usecase: RegionSettingUseCase!
    private var repository: RegionSettingRepositoryProtocol!
    
    override func setUpWithError() throws {
        try super.setUpWithError()

        repository = MockRegionSettingRepository()
        
        usecase = RegionSettingUseCase(regionSettingRepository: repository)
    }

    override func tearDownWithError() throws {
        repository = nil
        usecase = nil
        
        try super.tearDownWithError()
    }
    
    // MARK: 사용자 설정 지역 불러오기
    func test_사용자설정_지역_불러오기() {
        // given
        let expectedResult = Region(mainRegion: "서울", subRegion: "서울")
        
        var regionResult: Region!
        
        // when
        usecase.fetchRegion { result in
            switch result {
            case .success(let region):
                regionResult = region
            case .failure(let error):
                XCTFail("error: \(error)")
            }
        }
        
        // then
        XCTAssertEqual(expectedResult, regionResult)
    }
    
    // MARK: 태마 개수가 추가된 모든 지역 불러오기
    func test_태마개수가_추가된_모든지역_불러오기() {
        // given
        let expectedResult = mockRegionsWithThemeCount
        
        var regionsResult: Regions!
        
        // when
        usecase.fetchRegions(isRequestThemesCount: true) { result in
            switch result {
            case .success(let regions):
                regionsResult = regions
            case .failure(let error):
                XCTFail("error: \(error)")
            }
        }
        
        // then
        XCTAssertEqual(expectedResult, regionsResult)
    }
    
    // MARK: 태마 개수 없이 모든 지역 불러오기
    func test_태마개수_없이_모든지역_불러오기() {
        // given
        let expectedResult = mockRegions
        
        var regionsResult: Regions!
        
        // when
        usecase.fetchRegions(isRequestThemesCount: false) { result in
            switch result {
            case .success(let regions):
                regionsResult = regions
            case .failure(let error):
                XCTFail("error: \(error)")
            }
        }
        
        // then
        XCTAssertEqual(expectedResult, regionsResult)
    }
    
    // MARK: 사용자설정 지역 저장하기
    func test_사용자설정_지역_저장하기() {
        // given
        let expectedResult = Region(mainRegion: "서울", subRegion: "서울")
        let saveRegion = Region(mainRegion: "서울", subRegion: "서울")
        
        var regionResult: Region!
        
        // when
        usecase.saveRegion(newRegion: saveRegion) { result in
            switch result {
            case .success(let region):
                regionResult = region
            case .failure(let error):
                XCTFail("error: \(error)")
            }
        }
        
        // then
        XCTAssertEqual(expectedResult, regionResult)
    }
}
