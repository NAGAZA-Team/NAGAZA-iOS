//
//  File.swift
//  Nagaza
//
//  Created by 전성훈 on 2023/10/20.
//

import Foundation

// TODO: LoginViewModel Coordinator protocol
protocol LoginCoordinatorActions: CoordinatorActions {
    func login()
}

final class LoginViewModel: NagazaViewModel {    
    private weak var actions: LoginCoordinatorActions?
    
    struct Input {
        
    }
    
    struct Output {
        
    }
    
    init() { }
    
    func setCoordinatorActions(with actions: CoordinatorActions) {
        self.actions = actions as? LoginCoordinatorActions
    }
    
    func transform(input: Input) -> Output {
        return Output()
    }
}
