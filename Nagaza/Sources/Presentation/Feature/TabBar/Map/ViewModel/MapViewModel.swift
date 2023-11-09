//
//  MapViewModel.swift
//  Nagaza
//
//  Created by 전성훈 on 2023/10/20.
//

import RxSwift
import RxCocoa

struct MapViewModelActions {
    
}

final class MapViewModel: ViewModelType {
    
    private let actions: MapViewModelActions!
    
    struct Input {
        let viewWillAppearTrigger: Driver<Void>
    }
    
    struct Output {
        let maps: Driver<String>
    }
    
    init(actions: MapViewModelActions) {
        self.actions = actions
    }
    
    func transform(input: Input) -> Output {
        let maps = input.viewWillAppearTrigger
            .flatMapLatest { _ in
                Driver.just("hello world")
            }.asDriver(onErrorJustReturn: "hi")
        
        return Output(maps: maps)
    }
}
