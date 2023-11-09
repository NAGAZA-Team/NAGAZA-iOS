//
//  File.swift
//  Nagaza
//
//  Created by 전성훈 on 2023/10/20.
//

import Foundation

/// 화면 전환 등 액션, coordinator에서 직접 주입
struct LoginViewModelActions {
    let showTabBar: () -> Void
}

protocol LoginViewModelInput {
    func didTappedLogin()
}

protocol LoginViewModelOutput {
    
}

typealias LoginViewModelProtocol = LoginViewModelInput & LoginViewModelOutput

final class LoginViewModel: LoginViewModelProtocol {
    private let actions: LoginViewModelActions!
    
    // MARK: Output
    
    init(
        actions: LoginViewModelActions
    ) {
        self.actions = actions
    }
}

// MARK: Input
extension LoginViewModel {
    func didTappedLogin() {
        actions?.showTabBar()
    }
}
