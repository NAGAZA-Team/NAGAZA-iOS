//
//  HomeUseCase.swift
//  Nagaza
//
//  Created by SeungMin on 1/6/24.
//
//
import RxSwift

protocol HomeUseCaseProtocol: AnyObject {
    func fetchCafesList() -> Single<CafesPage>
    func fetchRoomsList(cafeId: Int) -> Single<RoomsPage>
}

final class DefaultHomeUseCase: HomeUseCaseProtocol {
    private let repository: HomeRepositoryProtocol
    
    init(roomsRepository: HomeRepositoryProtocol) {
        self.repository = roomsRepository
    }
    
    func fetchCafesList() -> Single<CafesPage> {
        return repository.fetchCafesList()
    }
    
    func fetchRoomsList(cafeId: Int) -> Single<RoomsPage> {
        return repository.fetchRoomsList(cafeId: cafeId)
    }
}
