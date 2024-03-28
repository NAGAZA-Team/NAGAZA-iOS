//
//  MapRepository.swift
//  Nagaza
//
//  Created by SeungMin on 3/14/24.
//

//import RxSwift
//import Moya
//
//final class MapRepository: ProviderProtocol {
//    typealias Target = MapTarget
//    var provider: MoyaProvider<Target>
//    
//    init(isStub: Bool, sampleStatusCode: Int, customEndpointClosure: ((Target) -> Moya.Endpoint)?) {
//        self.provider = Self.consProvider(isStub, sampleStatusCode, customEndpointClosure)
//    }
//}
//
//extension MapRepository: MapRepositoryInterface {
//    func fetchRecentKeywordList() -> Single<RecentKeywordPage> {
//        request(
//            type: RecentKeywordResponse.self,
//            target: .fetchRecentKeywordList
//        )
//        .map { $0.toDomain() }
//    }
//}
