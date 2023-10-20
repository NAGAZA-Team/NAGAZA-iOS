//
//  MapViewController.swift
//  Nagaza
//
//  Created by SeungMin on 2023/10/18.
//

import UIKit

final class MapViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        view.addSubview(MapView(frame: CGRect(x: 0, y: 0, width: 300, height: 300)))
    }
}

#if DEBUG
import SwiftUI

struct MapViewControllerPreview: PreviewProvider {
    static var previews: some View {
        let viewController = MapViewController()
        return viewController.toPreView()
    }
}
#endif
