//
//  LoginViewController.swift
//  Nagaza
//
//  Created by SeungMin on 2023/10/18.
//

import UIKit

final class LoginViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
    }
}

#if DEBUG
import SwiftUI

struct LoginViewControllerPreview: PreviewProvider {
    static var previews: some View {
        let viewController = LoginViewController()
        return viewController.toPreView()
    }
}
#endif
