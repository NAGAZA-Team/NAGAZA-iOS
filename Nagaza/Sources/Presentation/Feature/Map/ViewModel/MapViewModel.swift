//
//  MapViewModel.swift
//  Nagaza
//
//  Created by 전성훈 on 2023/10/20.
//

import RxSwift
import RxCocoa

final class MapViewModel: ViewModelType {
    struct Input {
        let viewWillAppearTrigger: Driver<Void>
    }
    
    struct Output {
        let maps: Driver<String>
    }
    
    func transform(input: Input) -> Output {
        let maps = input.viewWillAppearTrigger
            .flatMapLatest { _ in
                Driver.just("hello world")
            }.asDriver(onErrorJustReturn: "hi")
        
        return Output(maps: maps)
    }
}
