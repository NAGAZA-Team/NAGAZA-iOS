//
//  MainViewModel.swift
//  Nagaza
//
//  Created by 전성훈 on 2023/10/19.
//

import Foundation

/// 화면 전환 등 액션, coordinator에서 직접 주입
struct MainViewModelActions {
    let logoutTest: () -> Void
}

protocol MainViewModelInput {
    func logoutTest()
}

protocol MainViewModelOutput {
//    var textFieldText: Observable<String?> { get }
}

typealias MainViewModelProtocol = MainViewModelInput & MainViewModelOutput

final class MainViewModel: MainViewModelProtocol {
    
    private let actions: MainViewModelActions!
    
    // MARK: Output
    
//    let textFieldText: Observable<String?> = Observable(nil)

    /// 의존성 주입
    init(
        actions: MainViewModelActions
    ) {
        self.actions = actions
        print("Main View Model Init")
    }
    
    deinit {
        print("Main View Model Deinit")
    }
}

// MARK: Input
extension MainViewModel {
    func logoutTest() {
        actions.logoutTest()
    }
}
