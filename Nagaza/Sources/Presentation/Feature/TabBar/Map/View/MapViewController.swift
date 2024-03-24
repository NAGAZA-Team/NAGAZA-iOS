//
//  MapViewController.swift
//  Nagaza
//
//  Created by SeungMin on 2023/10/18.
//

import UIKit
import MapKit

import RxSwift
import RxCocoa
import RxGesture

final class MapViewController: NagazaBaseViewController {
    private var viewModel: MapViewModel!
    
    lazy var mapView: MKMapView = {
        let mapView = MKMapView()
        mapView.showsUserLocation = true
        return mapView
    }()
    
    lazy var mapSearchView = MapSearchView()
    
    static func create(with viewModel: MapViewModel) -> MapViewController {
        let vc = MapViewController()
        vc.viewModel = viewModel
        
        return vc
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    override func makeUI() {
        view.addSubview(mapView)
        mapView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        view.addSubview(mapSearchView)
        mapSearchView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(25)
            $0.leading.trailing.equalToSuperview().inset(13)
            $0.height.equalTo(60)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDelegate()
        locationManagerDidChangeAuthorization()
    }
    
    override func bindViewModel() {
        let searchViewTapTrigger = mapSearchView.rx.tapGesture()
            .when(.recognized)
            .map { _ in }.asDriverOnErrorJustEmpty()
        
        let input = MapViewModel.Input(searchViewTapTrigger: searchViewTapTrigger)
        
        let output = viewModel.transform(input: input)
        
        output.mapSearch
            .drive()
            .disposed(by: disposeBag)
    }
}

extension MapViewController {
    private func setupDelegate() {
        mapView.delegate = self
    }
    
    private func locationManagerDidChangeAuthorization() {
        let manager = CLLocationManager()
        
        switch manager.authorizationStatus {
        case .authorizedWhenInUse:  // Location services are available.
            //            enableLocationFeatures()
            print("Authorized When In Use!")
            break
            
        case .restricted, .denied:  // Location services currently unavailable.
            //            disableLocationFeatures()
            print("Restricted or Denied!")
            break
            
        case .notDetermined:        // Authorization not determined yet.
            manager.requestWhenInUseAuthorization()
            print("Not Determined!")
            break
            
        default:
            print("Else!")
            break
        }
    }
}

extension MapViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        let region = MKCoordinateRegion(
            center: userLocation.coordinate,
            latitudinalMeters: 500,
            longitudinalMeters: 500
        )
        mapView.region = region
    }
}

//#if DEBUG
//import SwiftUI
//
//struct MapViewControllerPreview: PreviewProvider {
//    static var previews: some View {
//        let actions = MapViewModelActions()
//        let viewModel = MapViewModel(actions: actions)
//        let viewController = MapViewController.create(with: viewModel)
//        return viewController.toPreView()
//    }
//}
//#endif
