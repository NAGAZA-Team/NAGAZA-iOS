//
//  File.swift
//  Nagaza
//
//  Created by 전성훈 on 2023/10/20.
//

import Foundation

/// 화면 전환 등 액션, coordinator에서 직접 주입
struct LoginViewModelActions {
    
}

protocol LoginViewModelInput {
    
}

protocol LoginViewModelOutput {
    
}

typealias LoginViewModelProtocol = LoginViewModelInput & LoginViewModelOutput

final class LoginViewModel: LoginViewModelProtocol {
    private let actions: LoginViewModelActions?
    
    // MARK: Output
    
    init(
        actions: LoginViewModelActions? = nil
    ) {
        self.actions = actions
    }
}

// MARK: Input
extension LoginViewModel {
    
}
