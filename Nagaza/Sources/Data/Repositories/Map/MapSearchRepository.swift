//
//  MapSearchRepository.swift
//  Nagaza
//
//  Created by SeungMin on 3/20/24.
//

import RxSwift
import Moya

final class MapSearchRepository: ProviderProtocol {
  
    typealias Target = MapSearchTarget
    var provider: MoyaProvider<Target>?
    
    init() {
        
    }
    
    func configureProvider(isStub: Bool = false, sampleStatusCode: Int = 200, customEndpointClosure: ((Target) -> Moya.Endpoint)? = nil) {
        provider = consProvider(isStub, sampleStatusCode, customEndpointClosure)
    }
    
    func consProvider(_ isStub: Bool, _ sampleStatusCode: Int, _ customendpointClosure: ((MapSearchTarget) -> Moya.Endpoint)?) {
        
    }
    
    
//    init(isStub: Bool, sampleStatusCode: Int, customEndpointClosure: ((Target) -> Moya.Endpoint)?) {
//        self.provider = consProvider(isStub, sampleStatusCode, customEndpointClosure)
//    }
}

extension MapSearchRepository: MapSearchRepositoryInterface {
    func fetchPlaces(with keyword: String) -> Single<PlacePage> {
        request(
            type: PlaceResponse.self,
            target: .fetchPlacesList(
                request: KeywordSearchRequest(query: keyword)
            )
        )
        .map { $0.toDomain() }
    }
}
