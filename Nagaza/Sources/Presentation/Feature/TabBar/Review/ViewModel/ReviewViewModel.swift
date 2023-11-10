//
//  ReviewViewModel.swift
//  Nagaza
//
//  Created by 전성훈 on 2023/10/20.
//

import Foundation

/// 화면 전환 등 액션, coordinator에서 직접 주입
struct ReviewViewModelActions {
    
}

protocol ReviewViewModelInput {
    
}

protocol ReviewViewModelOutput {
    
}

typealias ReviewViewModelProtocol = ReviewViewModelInput & ReviewViewModelOutput

final class ReviewViewModel: ReviewViewModelProtocol {
    
    private let actions: ReviewViewModelActions!
    
    // MARK: Output
    
    // 의존성 주입
    init(
        actions: ReviewViewModelActions
    ) {
        self.actions = actions
    }
}

// MARK: Input
extension ReviewViewModel {
    
}
