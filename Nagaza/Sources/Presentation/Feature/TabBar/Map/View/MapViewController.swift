//
//  MapViewController.swift
//  Nagaza
//
//  Created by SeungMin on 2023/10/18.
//

import UIKit
import MapKit

final class MapViewController: NagazaBaseViewController {
    let mapView = MapView()
    
    private var viewModel: MapViewModel!
    
    static func create(with viewModel: MapViewModel) -> MapViewController {
        let vc = MapViewController()
        vc.viewModel = viewModel
        
        return vc
    }
    
    override func loadView() {
        super.loadView()
        view = mapView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDelegate()
        
//        let locationManager = CLLocationManager()
//        
//        locationManager.requestWhenInUseAuthorization()
//        locationManager.desiredAccuracy = kCLLocationAccuracyBest
//        locationManager.distanceFilter = kCLDistanceFilterNone
//        locationManager.startUpdatingLocation()
//        mapView.mapView.showsUserLocation = true
        locationManagerDidChangeAuthorization()
    }
    
    override func bindViewModel() {
        let viewWillAppearTrigger = self.rx.viewWillAppear.map { _ in }.asDriverOnErrorJustEmpty()
        
        let input = MapViewModel.Input(viewWillAppearTrigger: viewWillAppearTrigger)
        
        let output = viewModel.transform(input: input)
        
        output.maps
            .drive()
            .disposed(by: disposeBag)
    }
}

extension MapViewController {
    private func setupDelegate() {
        mapView.mapView.delegate = self
    }
    
    private func locationManagerDidChangeAuthorization() {
        let manager = CLLocationManager()
        switch manager.authorizationStatus {
        case .authorizedWhenInUse:  // Location services are available.
//            enableLocationFeatures()
            print("authorizedWhenInUse")
            break
            
        case .restricted, .denied:  // Location services currently unavailable.
//            disableLocationFeatures()
            print("restricted or denied")
            break
            
        case .notDetermined:        // Authorization not determined yet.
            manager.requestWhenInUseAuthorization()
        
            print("notDetermined")
            break
            
        default:
            break
        }
    }
}

extension MapViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        let region = MKCoordinateRegion(center: userLocation.coordinate,
                                        latitudinalMeters: 1000,
                                        longitudinalMeters: 1000)
        mapView.region = region
    }
}

#if DEBUG
import SwiftUI

struct MapViewControllerPreview: PreviewProvider {
    static var previews: some View {
        let actions = MapViewModelActions()
        let viewModel = MapViewModel(actions: actions)
        let viewController = MapViewController.create(with: viewModel)
        return viewController.toPreView()
    }
}
#endif
