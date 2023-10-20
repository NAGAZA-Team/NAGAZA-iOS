//
//  MyPageViewModel.swift
//  Nagaza
//
//  Created by 전성훈 on 2023/10/20.
//

import Foundation

/// 화면 전환 등 액션, coordinator에서 직접 주입
struct MyPageViewModelActions {
    
}

protocol MyPageViewModelInput {
    
}

protocol MyPageViewModelOutput {
    
}

typealias MyPageViewModelProtocol = MyPageViewModelInput & MyPageViewModelOutput

final class MyPageViewModel: MyPageViewModelProtocol {
    private let actions: MyPageViewModelActions?
    
    // MARK: Output
    
    // 의존성 주입
    init(
        actions: MyPageViewModelActions? = nil
    ) {
        self.actions = actions
    }
}

// MARK: Input
extension MyPageViewModel {
    
}
