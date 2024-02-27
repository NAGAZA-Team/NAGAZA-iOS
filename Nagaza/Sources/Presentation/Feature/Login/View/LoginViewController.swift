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
    
    private lazy var appLogo: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "img_launch")
        imageView.frame = CGRect(x: 0, y: 0, width: 250, height: 170)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var snsLoginStackView: UIStackView = {
        let stackView = UIStackView(
            arrangedSubviews: [
                appleLoginBtn,
                kakaoLoginBtn,
                naverLoginBtn
            ]
        )
        
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 23
      
        return stackView
    }()
    
    private lazy var appleLoginBtn: UIButton = {
        var config = UIButton.Configuration.filled()
        
        var titleContainer = AttributeContainer()
        titleContainer.font = UIFont.ngaSubTitle1M
        config.imagePadding = 12
        config.image = UIImage(named: "ic_apple")
        config.attributedTitle = AttributedString("애플로 로그인", attributes: titleContainer)
        config.titleAlignment = .center
        let button = UIButton(configuration: config)
        button.tintColor = NagazaAsset.Colors.black.color
        button.layer.cornerRadius = 16
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(moveSignUpView), for: .touchUpInside)
        return button
    }()
    
    private lazy var kakaoLoginBtn: UIButton = {
        var config = UIButton.Configuration.filled()
        
        var titleContainer = AttributeContainer()
        titleContainer.font = UIFont.ngaSubTitle1M
        
        config.attributedTitle = AttributedString("카카오로 로그인", attributes: titleContainer)
        
        config.imagePadding = 12
        config.image = UIImage(named: "ic_kakao")
        config.titleAlignment = .center
        config.baseForegroundColor = .black
        let button = UIButton(configuration: config)
        button.tintColor = NagazaAsset.Colors.yellowKakao.color
        button.layer.cornerRadius = 16
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(moveSignUpView), for: .touchUpInside)
        return button
    }()
    
    private lazy var naverLoginBtn: UIButton = {
        var config = UIButton.Configuration.filled()
        
        var titleContainer = AttributeContainer()
        titleContainer.font = UIFont.ngaSubTitle1M
        
        config.titleAlignment = .center
        config.imagePadding = 12
        config.image = UIImage(named: "ic_naver")
        
        config.attributedTitle = AttributedString("네이버로 로그인", attributes: titleContainer)
        
        let button = UIButton(configuration: config)
        button.tintColor = .systemGreen
        button.layer.cornerRadius = 16
        button.layer.masksToBounds = true
        button.tintColor = NagazaAsset.Colors.greenNaver.color
        button.addTarget(self, action: #selector(moveSignUpView), for: .touchUpInside)
        return button
    }()
    
    @objc private func moveSignUpView() {
        let vc = EscapeExperienceViewController()
        _ = UINavigationController(rootViewController: vc)
        self.navigationController?.pushViewController(vc, animated: true)
    }
   
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
        view.backgroundColor = .white
        view.addSubview(appLogo)
        view.addSubview(snsLoginStackView)
        
        appLogo.snp.makeConstraints {
            $0.top.equalTo(view.snp.top).inset(162)
            $0.left.right.equalToSuperview().inset(64)
        }
        
        snsLoginStackView.snp.makeConstraints {
            $0.top.equalTo(appLogo.snp.bottomMargin).offset(134)
            $0.bottom.equalTo(view.snp.bottom).inset(101)
            $0.left.right.equalToSuperview().inset(32)
        }
        
        appleLoginBtn.snp.makeConstraints {
            $0.left.right.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(60)
        }
        
        kakaoLoginBtn.snp.makeConstraints {
            $0.left.right.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(60)
        }
        
        naverLoginBtn.snp.makeConstraints {
            $0.left.right.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(60)
        }
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
