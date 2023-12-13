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

final class HomeViewModel: ViewModelType {
    
    private let actions: MainViewModelActions!
    
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
    
    struct Input {
        let contentOffset: Driver<CGPoint>
    }
    
    struct Output {
        let scrollOffsetState: Driver<ScrollOffsetState>
    }
    
    init(
        actions: MainViewModelActions
    ) {
        self.actions = actions
    }
    
    func transform(input: Input) -> Output {
        let scrollOffsetState = input.contentOffset
            .map { ScrollOffsetState(rawValue: $0.y) }
        
        return Output(scrollOffsetState: scrollOffsetState)
    }
}

// MARK: Coordinator Actions
extension HomeViewModel {
    func logoutTest() {
        actions.logoutTest()
    }
}
