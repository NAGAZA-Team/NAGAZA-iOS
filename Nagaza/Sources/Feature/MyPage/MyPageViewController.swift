//
//  MyPageViewController.swift
//  Nagaza
//
//  Created by SeungMin on 2023/10/18.
//

import UIKit

final class MyPageViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
