//
//  MyPageAppSettingViewModel.swift
//  Nagaza
//
//  Created by 강조은 on 3/17/24.
//

import Foundation
import RxSwift
import RxCocoa

//struct MyPageAppSettingViewModelActions {
//    var finishMyPageAppSettingVC: () -> Void
//}

protocol AppSettingCoordinatorActions: CoordinatorActions {
    func popViewController()
}

final class AppSettingViewModel: NagazaViewModel {
    private weak var actions: AppSettingCoordinatorActions?
    
    private var disposeBag = DisposeBag()
    
    struct Input {
        let tapBackButton: Driver<Void>
    }
    
    struct Output {
    }

    init() { }
    
    func setCoordinatorActions(with actions: CoordinatorActions) {
        self.actions = actions as? AppSettingCoordinatorActions
    }
    
    func transform(input: Input) -> Output {
        input.tapBackButton
            .drive(with: self, onNext: { owner, event in
                owner.actions?.popViewController()
            })
            .disposed(by: disposeBag)
        
        return Output()
    }
    
    private func popViewController() {
        actions?.popViewController()
    }
}
