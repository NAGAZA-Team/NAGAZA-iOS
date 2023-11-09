//
//  MyPageViewController.swift
//  Nagaza
//
//  Created by SeungMin on 2023/10/18.
//

import UIKit

final class MyPageViewController: UIViewController {
    
    private var viewModel: MyPageViewModel!
    
    static func create(with viewModel: MyPageViewModel) -> MyPageViewController {
        let vc = MyPageViewController()
        vc.viewModel = viewModel
        
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
    }
}

#if DEBUG
import SwiftUI

struct MyPageViewControllerPreview: PreviewProvider {
    static var previews: some View {
        let viewController = MyPageViewController()
        return viewController.toPreView()
    }
}
#endif
