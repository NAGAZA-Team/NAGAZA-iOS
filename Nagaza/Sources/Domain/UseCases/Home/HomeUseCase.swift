//
//  HomeUseCase.swift
//  Nagaza
//
//  Created by SeungMin on 1/6/24.
//
//
import RxSwift

protocol HomeUseCaseInterface {
    func fetchCafesList() -> Single<CafesPage>
    func fetchRoomsList(cafeId: Int) -> Single<RoomsPage>
}

final class DefaultHomeUseCase: HomeUseCaseInterface {
    private let repository: HomeRepositoryInterface
    
    init(roomsRepository: HomeRepositoryInterface) {
        self.repository = roomsRepository
    }
    
    func fetchCafesList() -> Single<CafesPage> {
        return repository.fetchCafesList()
    }
    
    func fetchRoomsList(cafeId: Int) -> Single<RoomsPage> {
        return repository.fetchRoomsList(cafeId: cafeId)
    }
}
