//
//  MapViewController.swift
//  Nagaza
//
//  Created by SeungMin on 2023/10/18.
//

import UIKit

final class MapViewController: NagazaBaseViewController {
    let mapView = MapView()
    let viewModel: MapViewModel
    
    init(viewModel: MapViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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

#if DEBUG
import SwiftUI

struct MapViewControllerPreview: PreviewProvider {
    static var previews: some View {
        let viewModel = MapViewModel()
        let viewController = MapViewController(viewModel: viewModel)
        return viewController.toPreView()
    }
}
#endif
