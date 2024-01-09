//
//  Cafe.swift
//  Nagaza
//
//  Created by SeungMin on 1/7/24.
//

// TODO: 지울 예정
// 매장명    지점    지역    주소    위도    경도    매장 URL    매장 이미지 URL    총 테마 개수

import Foundation

struct Cafe {
    let id: Int
    let name: String
    let branch: String
    let area: String
    let address: String
    let location: Location
    let storeUrlString: String
    let storeImageUrlString: String
    let totalNumberOfThemes: Int
}

struct Location {
    let latitude: Double
    let longitude: Double
}

struct CafesPage {
    let cafes: [Cafe]
    let page: Int
    let totalPages: Int
}

extension Cafe: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    public static func == (lhs: Cafe, rhs: Cafe) -> Bool {
        lhs.id == rhs.id
    }
}
