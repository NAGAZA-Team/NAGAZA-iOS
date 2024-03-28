//
//  MapSearchRepositoryInterface.swift
//  Nagaza
//
//  Created by SeungMin on 3/20/24.
//

import RxSwift

protocol MapSearchRepositoryInterface {
    func fetchPlaces(with keyword: String) -> Single<PlacePage>
}
