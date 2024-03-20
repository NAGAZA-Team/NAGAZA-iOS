//
//  HomeRepositoryInterface.swift
//  Nagaza
//
//  Created by SeungMin on 1/6/24.
//

import RxSwift

protocol HomeRepositoryInterface {
    func fetchCafesList() -> Single<CafesPage>
    func fetchRoomsList(cafeId: Int) -> Single<RoomsPage>
}
