//
//  RegionSetiingViewModelTest.swift
//  NagazaTests
//
//  Created by 전성훈 on 4/24/24.
//

import XCTest

import RxSwift
import RxCocoa
import RxTest

@testable import Nagaza

final class RegionSetiingViewModelTest: XCTestCase {
    
    private var viewModel: RegionSettingViewModel!
    private var useCase: MockRegionSettingUseCase!
    
    private var scheduler: TestScheduler!
    private var disposeBag: DisposeBag!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        useCase = MockRegionSettingUseCase()
        viewModel = RegionSettingViewModel(
            isRequestThemeCount: true,
            regionSettingUseCase: useCase
        )
        
        scheduler = TestScheduler(initialClock: 0)
        disposeBag = DisposeBag()
    }

    override func tearDownWithError() throws {
        useCase = nil
        viewModel = nil
        
        scheduler = nil
        disposeBag = nil
        
        try super.tearDownWithError()
    }
    
    func test_초기뷰로딩시_모든지역데이터_불러오기() {
        // given
        let mockRegions = mockRegionsWithThemeCount
        let expectedMainRegions = mockRegions.mainRegion
        let expectedSubRegions = mockRegions.mainRegion
            .filter { $0.isSelected }
            .flatMap { $0.subRegions }
        
        useCase.mockFetchRegionsResult = .success(mockRegions)
        
        let viewWillAppear = scheduler.createColdObservable([.next(0, ())])
            .asDriverOnErrorJustEmpty()
        let mainRegionsObserver = scheduler.createObserver([MainRegion].self)
        let subRegionsObserver = scheduler.createObserver([SubRegion].self)
        
        let input = RegionSettingViewModel.Input(
            viewWillAppearTrigger: viewWillAppear,
            mainRegionSelected: Driver.empty(),
            regionSelectedModel: Driver.empty(),
            popViewControler: Driver.empty()
        )
        
        let output = viewModel.transform(input: input)
        
        // when
        scheduler.scheduleAt(0) {
            output.viewWillAppearTrigger
                .drive()
                .disposed(by: self.disposeBag)
        }
            
        scheduler.scheduleAt(10) {
            output.mainRegins
                .drive(mainRegionsObserver)
                .disposed(by: self.disposeBag)
            
            output.subRegions
                .drive(subRegionsObserver)
                .disposed(by: self.disposeBag)
        }

        scheduler.start()
        
        // then
        XCTAssertEqual(
            mainRegionsObserver.events,
            [.next(10, expectedMainRegions)]
        )
        
        XCTAssertEqual(
            subRegionsObserver.events,
            [.next(10, expectedSubRegions)]
        )
    }
    
    func test_초기뷰로딩시_모든지역데이터_불러오는과정에서_에러발생() {
        // given
        let mockError = MockDomainError.failedFetcing
        useCase.mockFetchRegionsResult = .failure(mockError)
        
        let viewWillAppear = scheduler.createColdObservable([.next(0, ())])
            .asDriverOnErrorJustEmpty()
        let errorObserver = scheduler.createObserver(MockDomainError.self)
        
        let input = RegionSettingViewModel.Input(
            viewWillAppearTrigger: viewWillAppear,
            mainRegionSelected: Driver.empty(),
            regionSelectedModel: Driver.empty(),
            popViewControler: Driver.empty()
        )
        
        let output = viewModel.transform(input: input)
        
        // when
        scheduler.scheduleAt(0) {
            output.viewWillAppearTrigger
                .drive()
                .disposed(by: self.disposeBag)
            
            output.error
                .map { error in
                    (error as! MockDomainError)
                }
                .drive(errorObserver)
                .disposed(by: self.disposeBag)
        }
        
        scheduler.start()
        
        // then
        XCTAssertEqual(
            errorObserver.events,
            [.next(0, mockError)]
        )
    }
    
    func test_대분류지역_선택시_상세지역_업데이트() {
        // given
        let mockRegions = mockRegionsWithThemeCount

        let expectecSubRegionsInit = mockRegions.mainRegion[0].subRegions
        let expectedSubRegions = mockRegions.mainRegion[1].subRegions
        
        useCase.mockFetchRegionsResult = .success(mockRegions)
        
        let viewWillAppear = scheduler.createColdObservable([.next(0, ())])
            .asDriverOnErrorJustEmpty()
        let mainRegionSelected = scheduler.createColdObservable([.next(10, 1)])
            .asDriverOnErrorJustEmpty()
        
        let subRegionsObserver = scheduler.createObserver([SubRegion].self)
        
        let input = RegionSettingViewModel.Input(
            viewWillAppearTrigger: viewWillAppear,
            mainRegionSelected: mainRegionSelected,
            regionSelectedModel: Driver.empty(),
            popViewControler: Driver.empty()
        )
        
        let output = viewModel.transform(input: input)
        
        // when
        scheduler.scheduleAt(0) {
            output.viewWillAppearTrigger
                .drive()
                .disposed(by: self.disposeBag)
            
            output.mainRegionSelected
                .drive()
                .disposed(by: self.disposeBag)
    
            output.subRegions
                .drive(subRegionsObserver)
                .disposed(by: self.disposeBag)
        }
        
        scheduler.start()
        
        // then
        XCTAssertEqual(
            subRegionsObserver.events,
            [.next(0, []),
             .next(0, expectecSubRegionsInit),
             .next(10, expectedSubRegions)]
        )
    }
        
    func test_상세지역_선택시_지역저장_성공() throws {
        // given
        let selectedRegion = Region(mainRegion: "서울", subRegion: "강남")
        useCase.mockSaveRegion = .success(selectedRegion)
                
        let regionSelectedModel = scheduler.createColdObservable([.next(10, selectedRegion)])
            .asDriverOnErrorJustEmpty()
        
        let input = RegionSettingViewModel.Input(
            viewWillAppearTrigger: Driver.empty(),
            mainRegionSelected: Driver.empty(),
            regionSelectedModel: regionSelectedModel,
            popViewControler: Driver.empty()
        )
        
        let output = viewModel.transform(input: input)
        let completedObserver = scheduler.createObserver(String.self)
        
        // when
        scheduler.scheduleAt(0) {
            output.regionSelected
                .map { _ in "저장 성공" }
                .drive(completedObserver)
                .disposed(by: self.disposeBag)
        }
        
        scheduler.start()
        
        // then
        XCTAssertEqual(
            completedObserver.events,
            [
                .next(10, "저장 성공")
            ]
        )
    }
}
