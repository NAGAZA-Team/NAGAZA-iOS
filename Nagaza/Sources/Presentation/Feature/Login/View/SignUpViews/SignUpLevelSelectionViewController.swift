//
//  LevelViewController.swift
//  Nagaza
//
//  Created by Nat Kim on 2024/02/19.
//

import UIKit

final class SignUpLevelSelectionViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }
    
    private lazy var questionLabel: UILabel = {
        let label = UILabel()
        label.text = "당신의 방탈출 레벨은..?"
        label.textAlignment = .center
        label.font = UIFont.ngaH4M
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var choiceButtonStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [lvLowButton, lvIntermediateButton, lvHighButton])
        stackView.axis = .horizontal
        stackView.alignment = .leading
        stackView.distribution = .fillEqually
        stackView.spacing = 15
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var lvLowButton: UIButton = {
        let button = UIButton()
        button.setTitle("하수", for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: 0, height: 44)
        button.setTitleColor(NagazaAsset.Colors.mainOrange.color, for: .normal)
        button.tintColor = .clear
        button.layer.borderColor = NagazaAsset.Colors.mainOrange.color.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 16
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(moveToSettingAOIView), for: .touchUpInside)
        return button
    }()
    
    private lazy var lvIntermediateButton: UIButton = {
        let button = UIButton()
        button.setTitle("중수", for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: 0, height: 44)
        button.setTitleColor(NagazaAsset.Colors.mainOrange.color, for: .normal)
        button.tintColor = .clear
        button.layer.borderColor = NagazaAsset.Colors.mainOrange.color.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 16
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        //button.addTarget(self, action: #selector(moveToSettingAOIView), for: .touchUpInside)
        return button
    }()
    
    private lazy var lvHighButton: UIButton = {
        let button = UIButton()
        button.setTitle("고수", for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: 0, height: 44)
        button.setTitleColor(NagazaAsset.Colors.mainOrange.color, for: .normal)
        button.tintColor = .clear
        button.layer.borderColor = NagazaAsset.Colors.mainOrange.color.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 16
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        //button.addTarget(self, action: #selector(moveToSettingAOIView), for: .touchUpInside)
        return button
    }()
    
    private lazy var nextButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("다음", for: .normal)
        button.setTitleColor(NagazaAsset.Colors.white.color, for: .normal)
        button.titleLabel?.font = UIFont.ngaH5M
        button.backgroundColor = NagazaAsset.Colors.mainOrange.color
        button.clipsToBounds = true
        button.layer.cornerRadius = 16
        button.translatesAutoresizingMaskIntoConstraints = false

        button.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        return button
    }()
    
    @objc private func nextButtonTapped() {
        let vc = SignUpRegionSelectionViewController()
        _ = UINavigationController(rootViewController: vc)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    private func setupUI() {
        view.addSubview(questionLabel)
        view.addSubview(choiceButtonStack)
        view.addSubview(nextButton)
        
        NSLayoutConstraint.activate([
            questionLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 343),
            questionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 106),
            questionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -106),
            
            choiceButtonStack.topAnchor.constraint(equalTo: questionLabel.bottomAnchor, constant: 50),
            choiceButtonStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 47),
            choiceButtonStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -46),
            
            lvLowButton.leadingAnchor.constraint(equalTo: choiceButtonStack.leadingAnchor),
            lvLowButton.heightAnchor.constraint(equalToConstant: 44),
            lvIntermediateButton.heightAnchor.constraint(equalToConstant: 44),
            lvHighButton.trailingAnchor.constraint(equalTo: choiceButtonStack.trailingAnchor),
            lvHighButton.heightAnchor.constraint(equalToConstant: 44),
            
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -54),
            nextButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            nextButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    @objc private func moveToSettingAOIView() {
        
    }
    /*
    @objc private func moveToThemeView() {
        let vc = ThemeSelectionViewController()
        _ = UINavigationController(rootViewController: vc)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    */
}

#if DEBUG
import SwiftUI

struct LevelViewControllerPreview: PreviewProvider {
    static var previews: some View {
        let viewController = SignUpLevelSelectionViewController()
        return viewController.toPreView()
    }
}
#endif


