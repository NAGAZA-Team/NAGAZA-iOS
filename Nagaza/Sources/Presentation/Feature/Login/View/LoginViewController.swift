//
//  LoginViewController.swift
//  Nagaza
//
//  Created by SeungMin on 2023/10/18.
//

import UIKit

import RxSwift
import RxCocoa
import SnapKit

final class LoginViewController: NagazaViewController, Alertable {
    
    private var viewModel: LoginViewModel!
    
    private lazy var loginButton: UIButton = {
        let btn = UIButton()
        
        btn.setTitle("로그인", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        
        return btn
    }()
    
    init(viewModel: LoginViewModel) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setCoordinatorActions(with actions: CoordinatorActions) {
        viewModel.setCoordinatorActions(with: actions)
    }
    
//    static func create(with viewModel: LoginViewModel) -> LoginViewController {
//        let vc = LoginViewController()
//        vc.viewModel = viewModel
//        
//        return vc
//    }
    
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
    
    override func bindViewModel() {
        let didTappedLogin = loginButton.rx.tap
            .map { _ in }
            .asDriverOnErrorJustEmpty()
        
        let input = LoginViewModel.Input(didTappedLogin: didTappedLogin)
        
        let output = viewModel.transform(input: input)
        
        output.didTappedLogin
            .drive()
            .disposed(by: disposeBag)
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
