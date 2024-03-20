//
//  MapUseCase.swift
//  Nagaza
//
//  Created by SeungMin on 3/14/24.
//

import RxSwift

final class MapUseCase {
    private let repository: MapRepositoryInterface
    
    init(roomsRepository: MapRepositoryInterface) {
        self.repository = roomsRepository
    }
    
    func fetchCafesList() -> Single<RecentKeywordPage> {
        return repository.fetchRecentKeywordList()
    }
}
