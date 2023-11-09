//
//  MainViewController.swift
//  Nagaza
//
//  Created by SeungMin on 2023/10/18.
//

import UIKit
import RxSwift

final class MainViewController: NagazaBaseViewController {
    
    private var viewModel: MainViewModel!
    
    private let textField = UITextField()
    private let label = UILabel()
    private let button = UIButton()
    
    static func create(with viewModel: MainViewModel) -> MainViewController {
        let vc = MainViewController()
        vc.viewModel = viewModel
        
        return vc
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        makeUI()
        bindViewModel()
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        print("Main Init")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    deinit {
        print("Main Deinit")
    }
    
    override func makeUI() {
        textField.borderStyle = .roundedRect
        
        let stackView = UIStackView(arrangedSubviews: [textField, label])
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            button.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 16)
        ])
        button.setTitle("로그아웃 테스트", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(logoutTest(_:)), for: .touchUpInside)
    }
    
    // MARK: Input
    @objc private func logoutTest(_ sender: UIButton) {
        viewModel.logoutTest()
    }
    
    // MARK: Output
    override func bindViewModel() {
        
    }
}

#if DEBUG

import SwiftUI

struct MainViewControllerPreview: PreviewProvider {
    static var previews: some View {
        let viewController = MainViewController()
        return viewController.toPreView()
    }
}
#endif
