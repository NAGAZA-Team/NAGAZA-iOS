//
//  MapViewController.swift
//  Nagaza
//
//  Created by SeungMin on 2023/10/18.
//

import UIKit

final class MapViewController: NagazaBaseViewController {
    let mapView = MapView()
    
    private var viewModel: MapViewModel!
    
    static func create(with viewModel: MapViewModel) -> MapViewController {
        let vc = MapViewController()
        vc.viewModel = viewModel
        
        return vc
    }
    
    override func loadView() {
        view = mapView
    }
    
    override func makeUI() {
        
    }
    
    override func navigationSetting() {
        super.navigationSetting()
        navigationItem.title = "맵"
        navigationController?.navigationBar.backgroundColor = .black
        let mapButtonItem = UIBarButtonItem(image: NagazaAsset.Images.icMapGray.image, style: .plain, target: nil, action: nil)
        
        let searchButtonItem = UIBarButtonItem(image: NagazaAsset.Images.icSearchGray.image, style: .plain, target: nil, action: nil)
        
        navigationItem.leftBarButtonItem = mapButtonItem
        navigationItem.rightBarButtonItem = searchButtonItem
    }
    
//    init(viewModel: MapViewModel) {
//        self.viewModel = viewModel
//        super.init(nibName: nil, bundle: nil)
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    
    override func bindViewModel() {
        let viewWillAppearTrigger = self.rx.viewWillAppear.map { _ in }.asDriverOnErrorJustEmpty()
        
        let input = MapViewModel.Input(viewWillAppearTrigger: viewWillAppearTrigger)
        
        let output = viewModel.transform(input: input)
        
        output.maps
            .drive()
            .disposed(by: disposeBag)
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
