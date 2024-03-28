//
//  Place.swift
//  Nagaza
//
//  Created by SeungMin on 3/20/24.
//

import Foundation

struct PlacePage {
    let placeList: [Place]
}

struct Place {
    let identifier = UUID()
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
}

extension Place: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }
    
    public static func == (lhs: Place, rhs: Place) -> Bool {
        lhs.identifier == rhs.identifier
    }
}
