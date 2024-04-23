//
//  MapSearchViewModel.swift
//  Nagaza
//
//  Created by SeungMin on 3/13/24.
//

import Foundation

import RxCocoa

//struct MapSearchViewModelActions {
//    var toMapVC: (Place) -> Void
//}

protocol MapSearchCoordinatorActions: CoordinatorActions {
    func popViewController()
}

final class MapSearchViewModel: NagazaViewModel {
    private weak var actions: MapSearchCoordinatorActions?
    
    private let mapSearchUseCase: MapSearchUseCaseInterface
//    private let actions: MapSearchViewModelActions!
    
    struct Input {
        let viewWillAppearTrigger: Driver<Void>
        let searchButtonTapTrigger: Driver<String>
        let itemSelectedTrigger: Driver<IndexPath>
        let popViewController: Driver<Void>
    }
    
    struct Output {
//        let recentKeywordList: Driver<[RecentKeyword]>
        let keywordList: Driver<[Place]>
        let itemSelectedTrigger: Driver<Void>
        let popViewController: Driver<Void>
    }
    
    init(
        mapUseCase: MapSearchUseCaseInterface
    ) {
        self.mapSearchUseCase = mapUseCase
    }
    
    deinit {
        print("MapSearchViewModel Deinit")
    }
    
    func setCoordinatorActions(with actions: CoordinatorActions) {
        self.actions = actions as? MapSearchCoordinatorActions
    }
    
    func transform(input: Input) -> Output {
//        let recentKeywordList = input.viewWillAppearTrigger
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
                self?.popViewController()
            }
        
        let popViewController = input.popViewController
            .do(onNext: { [weak self] in
                self?.popViewController()
            })
        
        return Output(
            keywordList: keywordList,
            itemSelectedTrigger: itemSelectedActionTrigger,
            popViewController: popViewController
        )
    }
    
    private func popViewController() {
        actions?.popViewController()
    }
}

extension MapSearchViewModel {
    func moveToMapVC(item: Place) {
//        actions.toMapVC(item)
    }
}
