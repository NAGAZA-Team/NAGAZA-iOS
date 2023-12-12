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
    
    struct Input {
        let contentOffset: Driver<CGPoint>
    }
    
    struct Output {
        let alphaValue: Driver<CGFloat>
    }
    
    init(
        actions: MainViewModelActions
    ) {
        self.actions = actions
    }
    
    func transform(input: Input) -> Output {
        let alphaValue = input.contentOffset
            .map { point -> CGFloat in
                let y = point.y
                switch y {
                case 70...310:
                    return (y - 70) / (310 - 70)
                case 310...:
                    return 1
                default:
                    return 0
                }
            }
        
        return Output(alphaValue: alphaValue)
    }
}

// MARK: Coordinator Actions
extension HomeViewModel {
    func logoutTest() {
        actions.logoutTest()
    }
}
