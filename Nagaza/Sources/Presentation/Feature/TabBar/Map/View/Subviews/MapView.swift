//
//  MapView.swift
//  Nagaza
//
//  Created by SeungMin on 2023/10/19.
//

import UIKit
import SnapKit
import MapKit

final class MapView: NagazaBaseView {
    lazy var mapView: MKMapView = {
        let mapView = MKMapView()
        if #available(iOS 16.0, *) {
            mapView.preferredConfiguration = MKStandardMapConfiguration()
        } else {
            
        }
//        mapView.region = .init(center: .init(latitude: 37.564214, longitude: 127.001699), span: .init())
        mapView.showsUserLocation = true
        return mapView
    }()
    
    override func makeUI() {
        self.addSubview(mapView)
        mapView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        print(mapView.userLocation.location,
              mapView.userLocation.coordinate,
              mapView.userLocation.isUpdating)
    }
}

#if DEBUG
import SwiftUI

struct CarouselViewPreview: PreviewProvider {
    static var previews: some View {
        MapView()
            .toPreView()
            .frame(width: 0,
                   height: 200)
    }
}
#endif
