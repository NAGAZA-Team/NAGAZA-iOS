//
//  MapViewModel.swift
//  Nagaza
//
//  Created by 전성훈 on 2023/10/20.
//

import RxSwift
import RxCocoa

struct MapViewModelActions {
    var toMapSearch: () -> Void
}

final class MapViewModel: ViewModelType {
//    private let mapUseCase: MapRepositoryInterface
    private let actions: MapViewModelActions!
    
    struct Input {
        let searchViewTapTrigger: Driver<Void>
    }
    
    struct Output {
        let mapSearch: Driver<Void>
    }
    
    init(actions: MapViewModelActions) {
        self.actions = actions
    }
    
    func transform(input: Input) -> Output {
        let mapSearch = input.searchViewTapTrigger
            .do { [weak self] _ in
                guard let self = self else { return }
                self.toMapSearch()
            }
            .asDriver()
        
        return Output(mapSearch: mapSearch)
    }
}

extension MapViewModel {
    func toMapSearch() {
        actions.toMapSearch()
    }
}
