//
//  MapViewModel.swift
//  Nagaza
//
//  Created by 전성훈 on 2023/10/20.
//

import RxSwift
import RxCocoa

struct MapViewModelActions {
    var toMapSearchVC: () -> Void
}

final class MapViewModel: ViewModelType {
//    private let mapUseCase: MapUseCaseInterface
    private let actions: MapViewModelActions!
    let searchItem = PublishRelay<Place?>()
    
    struct Input {
        let searchViewTapTrigger: Driver<Void>
    }
    
    struct Output {
        let mapSearch: Driver<Void>
        let searchItem: Driver<Place?>
    }
    
    init(actions: MapViewModelActions) {
        self.actions = actions
    }
    
    func transform(input: Input) -> Output {
        let mapSearch = input.searchViewTapTrigger
            .do { [weak self] _ in
                guard let self = self else { return }
                self.toMapSearchVC()
            }
            .asDriver()
        
        return Output(
            mapSearch: mapSearch,
            searchItem: searchItem.asDriverOnErrorJustEmpty()
        )
    }
}

extension MapViewModel {
    func toMapSearchVC() {
        actions.toMapSearchVC()
    }
}
