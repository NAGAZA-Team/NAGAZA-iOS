//
//  MapSearchViewModel.swift
//  Nagaza
//
//  Created by SeungMin on 3/13/24.
//

import RxCocoa

struct MapSearchViewModelActions {
    
}

final class MapSearchViewModel: ViewModelType {
    private let mapUseCase: MapRepositoryInterface
    private let actions: MapSearchViewModelActions!
    
    struct Input {
        let initialTrigger: Driver<Void>
    }
    
    struct Output {
        let recentKeywordList: Driver<[RecentKeyword]>
    }
    
    init(
        mapUseCase: MapRepositoryInterface,
        actions: MapSearchViewModelActions
    ) {
        self.mapUseCase = mapUseCase
        self.actions = actions
    }
    
    func transform(input: Input) -> Output {
        let recentKeywordList = input.initialTrigger
            .flatMapLatest { [weak self] _ in
                guard let self = self else { return Driver<[RecentKeyword]>.just([]) }
                return self.mapUseCase.fetchRecentKeywordList().map { $0.keywordList }
                    .asDriver(onErrorJustReturn: [])
            }
        
        return Output(recentKeywordList: recentKeywordList)
    }
}
