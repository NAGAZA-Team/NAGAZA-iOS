//
//  MyPageAppSettingViewModel.swift
//  Nagaza
//
//  Created by 강조은 on 3/17/24.
//

import Foundation

import Core
import MyPageInterface
import RxSwift
import RxCocoa

protocol AppSettingCoordinatorActions: CoordinatorActions {
    func popViewController()
}

final class AppSettingViewModel: NagazaViewModel {
    private weak var actions: AppSettingCoordinatorActions?
    
    private var disposeBag = DisposeBag()
    
    struct Input {
        let tapBackButton: Driver<Void>
        let viewDidLoadTrigger: Driver<Void>
    }
    
    struct Output {
        let tableViewData: Driver<[String]>
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
        
        let tableViewData = input.viewDidLoadTrigger
            .flatMapLatest { _ in
                return Driver.just(["테스트1","테스트2","테스트3"])
            }
        
        return Output(tableViewData: tableViewData)
    }
}
