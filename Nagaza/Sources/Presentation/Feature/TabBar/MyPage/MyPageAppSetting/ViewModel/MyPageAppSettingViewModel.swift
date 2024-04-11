//
//  MyPageAppSettingViewModel.swift
//  Nagaza
//
//  Created by 강조은 on 3/17/24.
//

import Foundation
import RxSwift
import RxCocoa

struct MyPageAppSettingViewModelActions {
    var finishMyPageAppSettingVC: () -> Void
}

final class MyPageAppSettingViewModel {
    
    private let actions: MyPageAppSettingViewModelActions!
    
    private var disposeBag = DisposeBag()
    
    struct Input {
        let tapBackButton: Driver<Void>
    }
    
    struct Output {
    }
    
    init(
        actions: MyPageAppSettingViewModelActions
    ) {
        self.actions = actions
    }
    
    func transform(input: Input) -> Output {
        input.tapBackButton
            .drive(with: self, onNext: { owner, event in
                owner.actions.finishMyPageAppSettingVC()
            })
            .disposed(by: disposeBag)
        
        return Output()
    }
}
