//
//  MainViewController.swift
//  Nagaza
//
//  Created by SeungMin on 2023/10/18.
//

import UIKit
import RxSwift

final class MainViewController: NagazaBaseViewController, Alertable {
    
    private var viewModel: MainViewModelProtocol = MainViewModel()
    
    private let textField = UITextField()
    private let label = UILabel()
    private let button = UIButton()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        makeUI()
        bindViewModel()
    }
    
    override func makeUI() {
        textField.borderStyle = .roundedRect
        textField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        
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
            button.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -16)
        ])
        button.setTitle("테스트", for: .normal)
        button.setTitleColor(.black, for: .normal)
    }
    
    // MARK: Input
    @objc private func textFieldDidChange() {
        viewModel.textDidChange(text: textField.text)
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
