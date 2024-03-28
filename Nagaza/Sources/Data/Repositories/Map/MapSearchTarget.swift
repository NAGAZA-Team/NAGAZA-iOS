//
//  MapSearchTarget.swift
//  Nagaza
//
//  Created by SeungMin on 3/20/24.
//

import Foundation

import Moya

enum MapSearchTarget {
    case fetchPlacesList(request: KeywordSearchRequest)
}

extension MapSearchTarget: TargetType {
    var baseURL: URL {
        return URL(string: "https://dapi.kakao.com/v2/")!
    }
    
    var headers: [String: String]? {
        if let apiKey = Keychain.shared.get(.apiKey) {
            return [
                "Authorization": "KakaoAK \(apiKey)",
                "Content-Type": "application/json",
            ]
        } else {
            return nil
        }
    }
    
    var path: String {
        switch self {
        case .fetchPlacesList:
            return "local/search/keyword"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .fetchPlacesList:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .fetchPlacesList(let request):
            return .requestParameters(
                parameters: request.toDictionary(),
                encoding: URLEncoding.queryString
            )
        }
    }
}


