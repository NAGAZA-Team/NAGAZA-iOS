//
//  MapViewController.swift
//  Nagaza
//
//  Created by SeungMin on 2023/10/18.
//

import UIKit

import RxSwift
import RxCocoa
import RxGesture
import NMapsMap


final class MapViewController: NagazaViewController {
    var viewModel: MapViewModel!
    
    private let mapView: NMFMapView = {
        let mapView = NMFMapView()
        mapView.positionMode = .direction
        return mapView
    }()
    
    private let mapSearchView = MapSearchView()
    
    init(viewModel: MapViewModel) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setCoordinatorActions(with actions: any CoordinatorActions) {
        viewModel.setCoordinatorActions(with: actions)
    }
    
//    static func create(with viewModel: MapViewModel) -> MapViewController {
//        let vc = MapViewController()
//        vc.viewModel = viewModel
//        
//        return vc
//    }
    
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
        
        output.searchItem
            .drive(self.rx.searchItem)
            .disposed(by: disposeBag)
    }
    
    func updateTextLabel(text: String) {
        self.mapSearchView.textLabel.text = text
        self.mapSearchView.textLabel.textColor = NagazaAsset.Colors.black.color
    }
    
    func updateLocation(with coordinates: CLLocationCoordinate2D) {
        let cameraUpdate = NMFCameraUpdate(scrollTo: NMGLatLng(lat: coordinates.latitude, lng: coordinates.longitude))
        self.mapView.moveCamera(cameraUpdate)
    }
}

extension MapViewController {
    private func setupDelegate() {
        //        mapView.delegate = self
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

extension Reactive where Base: MapViewController {
    var searchItem: Binder<Place?> {
        return Binder(self.base) { base, item in
            guard let item = item,
                  let latitude = Double(item.y),
                  let longitude = Double(item.x) else { return }
            base.updateTextLabel(text: item.placeName)
            base.updateLocation(
                with: CLLocationCoordinate2D(
                    latitude: latitude,
                    longitude: longitude
                )
            )
        }
    }
}
