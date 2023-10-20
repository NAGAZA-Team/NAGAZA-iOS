//
//  MainViewModel.swift
//  Nagaza
//
//  Created by 전성훈 on 2023/10/19.
//

import Foundation

struct MainViewModelActions {
    
}

protocol MainViewModelInput {
    func viewDidLoad()
    func textDidChange(text: String?)
}

protocol MainViewModelOutput {
    var textFieldText: Observable<String?> { get }
}

typealias MainViewModelProtocol = MainViewModelInput & MainViewModelOutput

final class MainViewModel: MainViewModelProtocol {
    
    // MARK: Output
    
    let textFieldText: Observable<String?> = Observable(nil)

    // 의존성 주입
    init(
    ) {
        
    }
}

// MARK: Input
extension MainViewModel {
    func viewDidLoad() {
        
    }
    
    func textDidChange(text: String?) {
        textFieldText.value = text
    }
}
