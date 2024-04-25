//
//  HomeViewModel.swift
//  Nagaza
//
//  Created by 전성훈 on 2023/10/19.
//

import Foundation

import RxSwift
import RxCocoa

/// 화면 전환 등 액션, coordinator에서 직접 주입
//struct HomeViewModelActions {
//    let showRegionSetting: (String, @escaping (String) -> Void) -> Void
//    let logoutTest: () -> Void
//}

protocol HomeCoordinatorActions: CoordinatorActions {
    func pushRegionSetting()
}

// MARK: - HomeViewModel
final class HomeViewModel: NagazaViewModel {
    private weak var actions: HomeCoordinatorActions?
    
    private let homeUseCase: HomeUseCaseProtocol
    private let regionSettingUseCase: RegionSettingUseCaseProtocol
            
    struct Input {
        let viewWillAppearTrigger: Driver<Void>
        let contentOffset: Driver<CGPoint>
        let didTappedMap: Driver<Void>
    }
    
    struct Output {
        let regionTitle: Driver<String>
        let roomsList: Driver<[[Room]]>
        let scrollOffsetState: Driver<ScrollOffsetState>
        let didTappedMap: Driver<Void>
    }
    
    init(
        homeUseCaseInterface: HomeUseCaseProtocol,
        regionSettingUseCase: RegionSettingUseCaseProtocol
    ) {
        self.homeUseCase = homeUseCaseInterface
        self.regionSettingUseCase = regionSettingUseCase
    }
    
    func setCoordinatorActions(with actions: CoordinatorActions) {
        self.actions = actions as? HomeCoordinatorActions
    }
    
    func transform(input: Input) -> Output {
        let fetchRegionResult = input.viewWillAppearTrigger
            .flatMapLatest { [weak self] _ -> Driver<String> in
                guard let self = self else { return Driver.just("테테스트")}
                return self.fetchRegionTitle()
            }
        
        let cafesResponse = input.viewWillAppearTrigger
            .flatMapLatest { [unowned self] _ in
                return homeUseCase.fetchCafesList()
                    .asDriver(onErrorJustReturn:.init(cafes: [],page: 0,totalPages: 0))
            }
        
        let roomsList = cafesResponse
            .flatMapLatest { cafesPage in
                if cafesPage.cafes.isEmpty { return Driver<[[Room]]>.just([]) }
                else {
                    let firstId = cafesPage.cafes[0].id
                    return self.homeUseCase.fetchRoomsList(cafeId: firstId)
                        .map { $0.roomsList }
                        .asDriver(onErrorJustReturn: [])
                }
            }
        
        let scrollOffsetState = input.contentOffset
            .map { ScrollOffsetState(rawValue: $0.y) }
        
        let mapButtonTapped = input.didTappedMap
            .map { [weak self] in
                self?.pushRegionSetting()
                
                return
            }
            .asDriver()
        
        return Output(
            regionTitle: fetchRegionResult,
            roomsList: roomsList,
            scrollOffsetState: scrollOffsetState,
            didTappedMap: mapButtonTapped
        )
    }
    
    private func fetchRegionTitle() -> Driver<String> {
        return Observable<String>.create { [weak self] observer in
            self?.regionSettingUseCase.fetchRegion { result in
                switch result {
                case .success(let region):
                    observer.onNext(region.subRegion)
                case .failure(let error):
                    observer.onError(error)
                }
            }
            return Disposables.create()
        }
        .observe(on: MainScheduler.instance)
        .asDriverOnErrorJustEmpty()
    }
    
    private func pushRegionSetting() {
        actions?.pushRegionSetting()
    }
}

// MARK: Coordinator Actions
//extension HomeViewModel {
//    func logoutTest() {
//        actions.logoutTest()
//    }
//}
