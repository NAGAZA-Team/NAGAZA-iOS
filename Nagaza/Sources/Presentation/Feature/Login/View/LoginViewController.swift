//
//  LoginViewController.swift
//  Nagaza
//
//  Created by SeungMin on 2023/10/18.
//

import UIKit

import SnapKit

final class LoginViewController: UIViewController, Alertable {
    
    private var viewModel: LoginViewModel!
    
    private lazy var loginButton: UIButton = {
        let btn = UIButton()
        
        btn.setTitle("로그인", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.addTarget(
            self,
            action: #selector(loginTapped(_:)),
            for: .touchUpInside
        )
        
        return btn
    }()
    
    static func create(with viewModel: LoginViewModel) -> LoginViewController {
        let vc = LoginViewController()
        vc.viewModel = viewModel
        
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    deinit {
        print("Login View Controller Deinit ")
    }
    
    private func setupView() {
        self.view.backgroundColor = .white
        
        [
            loginButton
        ].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            loginButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            loginButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
    }
    
    @objc private func loginTapped(_ sender: UIButton) {
        viewModel.didTappedLogin()
    }
}

#if DEBUGzX
import SwiftUI

struct LoginViewControllerPreview: PreviewProvider {
    static var previews: some View {
        let viewController = LoginViewController()
        return viewController.toPreView()
    }
}
#endif
