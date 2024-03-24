//
//  SignUpViewModel.swift
//  Nagaza
//
//  Created by Nat Kim on 2024/03/20.
//

import Foundation

struct SignUpViewModelAction {
    let moveView: () -> Void
}

protocol SignUpViewModelMove {
    func nextButtonTapped()
}

typealias SignUpViewModelProtocol = SignUpViewModelMove

final class SignUpViewModel: SignUpViewModelProtocol {

    let viewAction: SignUpViewModelAction!
    
    init(action: SignUpViewModelAction) {
        self.viewAction = action
    }
}

extension SignUpViewModel {
    func nextButtonTapped() {
        viewAction?.moveView()
    }
}

