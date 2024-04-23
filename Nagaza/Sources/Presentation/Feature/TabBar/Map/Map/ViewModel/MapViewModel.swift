//
//  MapViewModel.swift
//  Nagaza
//
//  Created by 전성훈 on 2023/10/20.
//

import RxSwift
import RxCocoa

//struct MapViewModelActions {
//    var toMapSearchVC: () -> Void
//}

protocol MapCoordinatorActions: CoordinatorActions {
    func pushMapSearch()
}

final class MapViewModel: NagazaViewModel {
//    private let actions: MapViewModelActions!
    private weak var actions: MapCoordinatorActions?
    
    let searchItem = PublishRelay<Place?>()
    
    struct Input {
        let searchViewTapTrigger: Driver<Void>
    }
    
    struct Output {
        let mapSearch: Driver<Void>
        let searchItem: Driver<Place?>
    }
    
    init() { }
//    init(actions: MapViewModelActions) {
//        self.actions = actions
//    }
    
    func setCoordinatorActions(with actions: CoordinatorActions) {
        self.actions = actions as? MapCoordinatorActions
    }
    
    func transform(input: Input) -> Output {
        let mapSearch = input.searchViewTapTrigger
            .do { [weak self] _ in
                guard let self = self else { return }
                self.pushMapSearch()
            }
            .asDriver()
        
        return Output(
            mapSearch: mapSearch,
            searchItem: searchItem.asDriverOnErrorJustEmpty()
        )
    }
    
    private func pushMapSearch() {
        actions?.pushMapSearch()
    }
}

extension MapViewModel {
    func toMapSearchVC() {
//        actions.toMapSearchVC()
    }
}
