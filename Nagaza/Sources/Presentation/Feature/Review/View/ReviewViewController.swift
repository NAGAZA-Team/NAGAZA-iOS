//
//  ReviewViewController.swift
//  Nagaza
//
//  Created by SeungMin on 2023/10/18.
//

import UIKit

final class ReviewViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
    }
}

#if DEBUG
import SwiftUI

struct ReviewViewControllerPreview: PreviewProvider {
    static var previews: some View {
        let viewController = ReviewViewController()
        return viewController.toPreView()
    }
}
#endif
