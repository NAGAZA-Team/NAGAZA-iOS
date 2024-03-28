//
//  PlaceResponse.swift
//  Nagaza
//
//  Created by SeungMin on 3/20/24.
//

import Foundation

struct PlaceResponse: Decodable {
    let documents: [PlaceResponseDTO]
}

struct PlaceResponseDTO: Decodable {
    let addressName: String
    let categoryGroupCode: String
    let categoryGroupName: String
    let categoryName: String
    let distance: String
    let id: String
    let phone: String
    let placeName: String
    let placeURL: String
    let roadAddressName: String
    let x: String
    let y: String
    
    enum CodingKeys: String, CodingKey {
        case addressName = "address_name"
        case categoryGroupCode = "category_group_code"
        case categoryGroupName = "category_group_name"
        case categoryName = "category_name"
        case distance, id, phone
        case placeName = "place_name"
        case placeURL = "place_url"
        case roadAddressName = "road_address_name"
        case x, y
    }
}

extension PlaceResponse {
    func toDomain() -> PlacePage {
        return PlacePage(
            placeList: self.documents.map { $0.toDomain() }
        )
    }
}

extension PlaceResponseDTO {
    func toDomain() -> Place {
        return Place(
            addressName: self.addressName,
            categoryGroupCode: self.categoryGroupCode,
            categoryGroupName: self.categoryGroupName,
            categoryName: self.categoryName,
            distance: self.distance,
            id: self.id,
            phone: self.phone,
            placeName: self.placeName,
            placeURL: self.placeURL,
            roadAddressName: self.roadAddressName,
            x: self.x,
            y: self.y
        )
    }
}
