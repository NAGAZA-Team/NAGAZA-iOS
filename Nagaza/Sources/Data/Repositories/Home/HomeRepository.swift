//
//  HomeRepository.swift
//  Nagaza
//
//  Created by SeungMin on 1/7/24.
//

import RxSwift
import Moya

final class HomeRepository: ProviderProtocol {
    typealias Target = HomeTarget
    var provider: MoyaProvider<Target>
    
    init(isStub: Bool, sampleStatusCode: Int, customEndpointClosure: ((Target) -> Moya.Endpoint)?) {
        self.provider = Self.consProvider(isStub, sampleStatusCode, customEndpointClosure)
    }
}

extension HomeRepository: HomeRepositoryInterface {
    func fetchCafesList() -> Single<CafesPage> {
        request(
            type: CafeResponse.self,
            target: .fetchCafesList
        )
        .map { $0.toDomain() }
    }
    
    func fetchRoomsList(cafeId: Int) -> Single<RoomsPage> {
        request(
            type: RoomsResponse.self,
            target: .fetchRoomsList(cafeId: cafeId)
        )
        .map { $0.toDomain() }
    }
}
