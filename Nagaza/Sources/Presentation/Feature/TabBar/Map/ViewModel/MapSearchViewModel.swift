//
//  MapSearchViewModel.swift
//  Nagaza
//
//  Created by SeungMin on 3/13/24.
//

import Foundation

import RxCocoa

struct MapSearchViewModelActions {
    var toMapVC: (Place) -> Void
}

final class MapSearchViewModel: ViewModelType {
    private let mapSearchUseCase: MapSearchUseCaseInterface
    private let actions: MapSearchViewModelActions!
    
    struct Input {
        let initialTrigger: Driver<Void>
        let searchButtonTapTrigger: Driver<String>
        let itemSelectedTrigger: Driver<IndexPath>
    }
    
    struct Output {
//        let recentKeywordList: Driver<[RecentKeyword]>
        let keywordList: Driver<[Place]>
        let itemSelectedActionTrigger: Driver<Void>
    }
    
    init(
        mapUseCase: MapSearchUseCaseInterface,
        actions: MapSearchViewModelActions
    ) {
        self.mapSearchUseCase = mapUseCase
        self.actions = actions
    }
    
    func transform(input: Input) -> Output {
//        let recentKeywordList = input.initialTrigger
//            .flatMapLatest { [weak self] _ in
//                guard let self = self else { return Driver<[RecentKeyword]>.just([]) }
//                return self.mapSearchUseCase.fetchRecentKeywordList().map { $0.keywordList }
//                    .asDriver(onErrorJustReturn: [])
//            }
        
        let keywordList = input.searchButtonTapTrigger
            .flatMapLatest { keyword in
                return self.mapSearchUseCase.fetchPlaces(with: keyword).map { $0.placeList }.asDriver(onErrorJustReturn: [])
            }
        
        let itemSelectedActionTrigger = input.itemSelectedTrigger
            .withLatestFrom(keywordList) { [weak self] indexPath, list in
                let item = list[indexPath.item]
                self?.moveToMapVC(item: item)
            }
        
        return Output(
            keywordList: keywordList,
            itemSelectedActionTrigger: itemSelectedActionTrigger
        )
    }
}

extension MapSearchViewModel {
    func moveToMapVC(item: Place) {
        actions.toMapVC(item)
    }
}
