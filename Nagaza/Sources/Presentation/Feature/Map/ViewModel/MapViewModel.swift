//
//  MapViewModel.swift
//  Nagaza
//
//  Created by 전성훈 on 2023/10/20.
//

import Foundation

/// 화면 전환 등 액션, coordinator에서 직접 주입
struct MapViewModelActions {
    
}

protocol MapViewModelInput {
    
}

protocol MapViewModelOutput {
    
}

typealias MapViewModelProtocol = MapViewModelInput & MapViewModelOutput

final class MapViewModel: MapViewModelProtocol {
    private let actions: MapViewModelActions?
    
    // MARK: Output
    
    // 의존성 주입
    init(
        actions: MapViewModelActions? = nil
    ) {
        self.actions = actions
    }
}

// MARK: Input
extension MapViewModel {
    
}
