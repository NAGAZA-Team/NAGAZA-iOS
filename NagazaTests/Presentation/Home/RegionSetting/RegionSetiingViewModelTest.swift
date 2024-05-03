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
        viewModel = RegionSettingViewModel(regionSettingUseCase: useCase)
        
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
    
    
}
