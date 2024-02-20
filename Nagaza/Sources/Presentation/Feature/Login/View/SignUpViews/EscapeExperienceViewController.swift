//
//  EscapeExperienceViewController.swift
//  Nagaza
//
//  Created by Nat Kim on 2024/02/19.
//

import UIKit

protocol EscapeExperienceViewDelegate: AnyObject {
    func didTapNextButton()
}

class EscapeExperienceViewController: UIViewController {
    
//    weak var delegate: EscapeExperienceViewDelegate?
    
    private lazy var questionLabel: UILabel = {
        let label = UILabel()
        label.text = "이전에 방탈출을 해 본 경험이 있나요?"
        label.textAlignment = .center
        label.font = UIFont.ngaH4M
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var choiceButtonStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [yesButton, noButton])
        stackView.axis = .horizontal
//        stackView.alignment = .leading
        stackView.distribution = .fillEqually
        stackView.spacing = 30
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var yesButton: UIButton = {
        let button = UIButton()
        button.setTitle("있어요", for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: 130, height: 72)
        button.setTitleColor(NagazaAsset.Colors.mainOrange.color, for: .normal)
        button.tintColor = .clear
        button.layer.borderColor = NagazaAsset.Colors.mainOrange.color.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 16
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(moveToLevelView), for: .touchUpInside)
        return button
    }()
    
    private lazy var noButton: UIButton = {
        let button = UIButton()
        button.setTitle("없어요", for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: 130, height: 72)
        button.setTitleColor(NagazaAsset.Colors.mainOrange.color, for: .normal)
        button.tintColor = .clear
        button.layer.borderColor = NagazaAsset.Colors.mainOrange.color.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 16
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc private func nextButtonTapped() {
//        delegate?.didTapNextButton()
    }
    
    @objc private func moveToLevelView() {
        let vc = LevelViewController()
        _ = UINavigationController(rootViewController: vc)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = NagazaAsset.Colors.white.color
        
        setupUI()
        setupNavigationBar()
    }

    private func setupNavigationBar() {
        // 내비게이션 바 타이틀 설정
        title = "SignUp"
        
        // 내비게이션 바 좌측에 뒤로가기 버튼 추가
        let backButton = UIBarButtonItem(
            image: UIImage(named: "ic_arrow_left_gray"), // 뒤로가기 아이콘 이미지
            style: .plain,
            target: self,
            action: #selector(backButtonTapped)
        )
        navigationItem.leftBarButtonItem = backButton
        
        // 내비게이션 바 표시
        navigationController?.isNavigationBarHidden = false
    }
    
    @objc private func backButtonTapped() {
        // 뒤로가기 버튼을 눌렀을 때의 동작을 정의
        navigationController?.popViewController(animated: true)
    }
    
    private func setupUI() {
        view.addSubview(questionLabel)
        view.addSubview(choiceButtonStack)
        
        NSLayoutConstraint.activate([
            questionLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 343),
            questionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 53),
            questionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -53),
            
            choiceButtonStack.topAnchor.constraint(equalTo: questionLabel.bottomAnchor, constant: 50),
            choiceButtonStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            choiceButtonStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            
            yesButton.leadingAnchor.constraint(equalTo: choiceButtonStack.leadingAnchor),
            yesButton.heightAnchor.constraint(equalToConstant: 72),
            noButton.trailingAnchor.constraint(equalTo: choiceButtonStack.trailingAnchor),
            noButton.heightAnchor.constraint(equalToConstant: 72),
        ])
    }
    
}

#if DEBUG
import SwiftUI

struct EscapeExperienceViewControllerPreview: PreviewProvider {
    static var previews: some View {
        let viewController = EscapeExperienceViewController()
        return viewController.toPreView()
    }
}
#endif
