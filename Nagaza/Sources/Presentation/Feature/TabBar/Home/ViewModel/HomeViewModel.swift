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
struct HomeViewModelActions {
    let logoutTest: () -> Void
}

enum ScrollOffsetState {
    case top(value: Double)
    case bottom
    
    init(rawValue: Double) {
        switch rawValue {
        case -CGFloat.greatestFiniteMagnitude..<CGFloat.windowFrameheight / 3:
            self = .top(value: rawValue)
        default:
            self = .bottom
        }
    }
    
    var alpha: Double {
        switch self {
        case .top(let value):
            return value / (CGFloat.windowFrameheight / 3)
        default:
            return 1
        }
    }
}

// MARK: - HomeViewModel
final class HomeViewModel: ViewModelType {
    private let homeUseCase: HomeRepositoryInterface
    private let actions: HomeViewModelActions!
    
    private var disposeBag = DisposeBag()
    
    struct Input {
        let initialTrigger: Driver<Void>
        let contentOffset: Driver<CGPoint>
    }
    
    struct Output {
        let roomsList: Driver<[[Room]]>
        let scrollOffsetState: Driver<ScrollOffsetState>
    }
    
    init(
        homeUseCase: HomeRepositoryInterface,
        actions: HomeViewModelActions
    ) {
        self.homeUseCase = homeUseCase
        self.actions = actions
    }
    
    func transform(input: Input) -> Output {
        let cafesResponse = input.initialTrigger
            .flatMapLatest { [unowned self] _ in
                return homeUseCase.fetchCafesList().asDriver(onErrorJustReturn: .init(cafes: [], page: 0, totalPages: 0))
            }

        let roomsList = cafesResponse
            .flatMapLatest { cafesPage in
                if cafesPage.cafes.isEmpty { return Driver<[[Room]]>.just([]) }
                else {
                    let firstId = cafesPage.cafes[0].id
                    return self.homeUseCase.fetchRoomsList(cafeId: firstId)
                        .map { $0.roomsList }.asDriver(onErrorJustReturn: [])
                }
            }
        
        let scrollOffsetState = input.contentOffset
            .map { ScrollOffsetState(rawValue: $0.y) }
        
        return Output(
            roomsList: roomsList,
            scrollOffsetState: scrollOffsetState
        )
    }
}

// MARK: Coordinator Actions
extension HomeViewModel {
    func logoutTest() {
        actions.logoutTest()
    }
}
