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
    
    lazy var searchTextField: UISearchTextField = {
        let searchTextField = UISearchTextField()
        
        let customView = UIView(frame: CGRect(x: -16, y: 0, width: 24, height: 24))
        let searchImageView = UIImageView()
        searchImageView.image = NagazaAsset.Images.imgSearch.image
        customView.addSubview(searchImageView)
        searchImageView.frame = customView.frame
        
        searchTextField.leftView = nil
        searchTextField.rightView = customView
        searchTextField.rightViewMode = .always
        searchTextField.clearButtonMode = .never
        searchTextField.placeholder = "검색어를 입력하세요"
        searchTextField.backgroundColor = .white
        searchTextField.isOpaque = true
        searchTextField.alpha = 1
        return searchTextField
    }()
    
    static func create(with viewModel: MapViewModel) -> MapViewController {
        let vc = MapViewController()
        vc.viewModel = viewModel
        
        return vc
    }
    
    override func loadView() {
        super.loadView()
        navigationController?.navigationBar.isHidden = true
        view = mapView
    }
    
    override func makeUI() {
        view.addSubview(searchTextField)
        searchTextField.snp.makeConstraints {
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
        guard let searchImageView = self.searchTextField.rightView else { return }
        
        let searchButtonTapTrigger = searchImageView.rx.tapGesture()
            .withLatestFrom(searchTextField.rx.text.map({ $0 ?? "" })) .asDriver(onErrorJustReturn: "")
        
        let input = MapViewModel.Input(searchButtonTapTrigger: searchButtonTapTrigger)
        
        let output = viewModel.transform(input: input)
        
        output.coordinates
            .do(onNext: { coordinates in
                guard let value = coordinates else {
                    // TODO: 입력한 값이 없을 때 처리
                    print("검색한 값이 없음!!")
                    return
                }
            })
            .map { [weak self] value in
                guard let self = self else { return MKCoordinateRegion() }
                guard let coordinates = value else { return self.mapView.region }
                return MKCoordinateRegion(
                    center:
                        CLLocationCoordinate2D(
                            latitude: coordinates.latitude,
                            longitude: coordinates.longitude
                        ),
                    latitudinalMeters: 500,
                    longitudinalMeters: 500
                )
            }
            .drive(mapView.rx.region)
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
