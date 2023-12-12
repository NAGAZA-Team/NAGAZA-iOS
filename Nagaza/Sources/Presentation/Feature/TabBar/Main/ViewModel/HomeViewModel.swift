//
//  MainViewModel.swift
//  Nagaza
//
//  Created by 전성훈 on 2023/10/19.
//

import Foundation

import RxCocoa

/// 화면 전환 등 액션, coordinator에서 직접 주입
struct MainViewModelActions {
    let logoutTest: () -> Void
}

enum HomeViewScrolled {
    case reset
    case start
    case coverRecommendTheme
}

final class HomeViewModel: ViewModelType {
    
    private let actions: MainViewModelActions!
    
    struct Input {
        let contentOffset: Driver<CGPoint>
    }
    
    struct Output {
        let isScrolled: Driver<HomeViewScrolled>
    }
    
    init(
        actions: MainViewModelActions
    ) {
        self.actions = actions
    }
    
    func transform(input: Input) -> Output {
        let isScrolled = input.contentOffset
            .map { point -> HomeViewScrolled in
                switch point.y {
                case ...70:
                    return .reset
                case 70...310:
                    return .start
                default:
                    return .coverRecommendTheme
                }
            }
        
        return Output(isScrolled: isScrolled)
    }
}

// MARK: Coordinator Actions
extension HomeViewModel {
    func logoutTest() {
        actions.logoutTest()
    }
}
