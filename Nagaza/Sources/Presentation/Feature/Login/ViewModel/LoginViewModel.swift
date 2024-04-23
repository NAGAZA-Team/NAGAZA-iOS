//
//  File.swift
//  Nagaza
//
//  Created by 전성훈 on 2023/10/20.
//

import RxSwift
import RxCocoa

// TODO: LoginViewModel Coordinator protocol
protocol LoginCoordinatorActions: CoordinatorActions {
    func pushTabBar()
}

final class LoginViewModel: NagazaViewModel {    
    private weak var actions: LoginCoordinatorActions?
    
    struct Input {
        let didTappedLogin: Driver<Void>
    }
    
    struct Output {
        let didTappedLogin: Driver<Void>
    }
    
    init() { }
    
    func setCoordinatorActions(with actions: CoordinatorActions) {
        self.actions = actions as? LoginCoordinatorActions
    }
    
    func transform(input: Input) -> Output {
        let didTappedLogin = input.didTappedLogin
            .map { [weak self] _ in
                self?.pushTabBar()
                
                return
            }
            .asDriver()
        
        return Output(didTappedLogin: didTappedLogin)
    }
    
    private func pushTabBar() {
        actions?.pushTabBar()
    }
}

