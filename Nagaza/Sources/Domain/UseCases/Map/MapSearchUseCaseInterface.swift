//
//  MapSearchUseCaseInterface.swift
//  Nagaza
//
//  Created by SeungMin on 3/20/24.
//

import RxSwift

protocol MapSearchUseCaseInterface {
    func fetchPlaces(with keyword: String) -> Single<PlacePage>
}

final class DefaultMapSearchUseCase: MapSearchUseCaseInterface {
    private let mapSearchRepository: MapSearchRepositoryInterface
//    private let recentSearchRepository: Recent
    
    
    init(roomsRepository: MapSearchRepositoryInterface) {
        self.mapSearchRepository = roomsRepository
    }
    
    func fetchPlaces(with keyword: String) -> Single<PlacePage> {
        return mapSearchRepository.fetchPlaces(with: keyword)
    }
}
