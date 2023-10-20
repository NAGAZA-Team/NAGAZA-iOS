//
//  MainViewController.swift
//  Nagaza
//
//  Created by SeungMin on 2023/10/18.
//

import UIKit

final class MainViewController: UIViewController {
    
    private var viewModel: MainViewModelProtocol = MainViewModel()
    
    private let textField = UITextField()
    private let label = UILabel()
    
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        bindViewModel()
    }
    
    private func setupUI() {
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
    }
    
    // MARK: Input
    @objc private func textFieldDidChange() {
        viewModel.textDidChange(text: textField.text)
    }
    
    // MARK: Output
    private func bindViewModel() {
        viewModel.textFieldText.subscribe(on: self)
            .onNext { [weak self] text in
                if let number = Int(text ?? "") {
                     let squared = number * number
                     if squared > 100000000000 {
                         self?.label.text = "작은 숫자를 입력하세요"
                     } else {
                         self?.label.text = "\(squared)"
                     }
                 } else {
                     self?.label.text = "숫자를 입력하세요"
                 }            }
            .disposedBy(disposeBag)
        
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
