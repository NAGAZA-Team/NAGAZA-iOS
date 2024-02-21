//
//  MapViewModel.swift
//  Nagaza
//
//  Created by 전성훈 on 2023/10/20.
//

import MapKit

import RxSwift
import RxCocoa

struct MapViewModelActions {
    
}

final class MapViewModel: ViewModelType {
    private let actions: MapViewModelActions!
    
    struct Input {
        let searchButtonTapTrigger: Driver<String>
    }
    
    struct Output {
        let coordinates: Driver<CLLocationCoordinate2D?>
    }
    
    init(actions: MapViewModelActions) {
        self.actions = actions
    }
    
    func transform(input: Input) -> Output {
        let coordinatesRelay = PublishRelay<CLLocationCoordinate2D?>()
        
        let searchRequestSequence = input.searchButtonTapTrigger
            .do(onNext: { searchText in
                guard !searchText.isEmpty else { return }
                
                let searchRequest = MKLocalSearch.Request()
                searchRequest.naturalLanguageQuery = searchText
                
                let localSearch = MKLocalSearch(request: searchRequest)
                localSearch.start { (response, error) in
                    guard let response = response else {
                        if let error = error {
                            print("검색 중 에러 발생: \(error.localizedDescription)")
                            coordinatesRelay.accept(nil)
                        }
                        return
                    }
                    
                    guard let first = response.mapItems.first else { return }
                    
                    coordinatesRelay.accept(
                        CLLocationCoordinate2D(
                            latitude: first.placemark.coordinate.latitude,
                            longitude: first.placemark.coordinate.longitude
                        )
                    )
                }
            })
        
        let coordinates = coordinatesRelay.asDriver(onErrorJustReturn: nil)
            .withLatestFrom(searchRequestSequence) { coordinates, _ in
                print("찾을 좌표 - \(coordinates)")
                return coordinates
            }
        
        return Output(coordinates: coordinates)
    }
}
