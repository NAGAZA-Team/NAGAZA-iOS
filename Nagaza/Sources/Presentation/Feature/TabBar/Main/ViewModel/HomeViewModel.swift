//
//  MainViewModel.swift
//  Nagaza
//
//  Created by 전성훈 on 2023/10/19.
//

import Foundation

/// 화면 전환 등 액션, coordinator에서 직접 주입
struct MainViewModelActions {
    let logoutTest: () -> Void
}

final class HomeViewModel: ViewModelType {
    
    private let actions: MainViewModelActions!
    
    struct Input {
        
    }
    
    struct Output {
        
    }
    
    init(
        actions: MainViewModelActions
    ) {
        self.actions = actions
    }

    func transform(input: Input) -> Output {
        
        return Output()
    }
}

// MARK: Input
extension HomeViewModel {
    func logoutTest() {
        actions.logoutTest()
    }
}
