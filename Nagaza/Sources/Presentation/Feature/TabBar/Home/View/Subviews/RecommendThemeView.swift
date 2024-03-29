//
//  RecommendThemeViewController.swift
//  Nagaza
//
//  Created by 전성훈 on 2023/12/01.
//

import UIKit

import RxSwift
import SnapKit

// TODO: Haert Components 제거
final class RecommendThemeView: NagazaBaseView {
    //    private var viewModel: HomeViewModel!
    
    private lazy var recommandThemeBackgroundTopGradientView = UIView()
    private lazy var recommandThemeBackgroundBottomGradientView = UIView()
    
    private lazy var heartIcon: UIButton = {
        let btn = UIButton()
        
        //        btn.addTarget(self,
        //                      action: #selector(heartTapped(_:)),
        //                      for: .touchUpInside
        //        )
        btn.setImage(UIImage(systemName: "heart"),
                     for: .normal
        )
        btn.setImage(UIImage(systemName: "heart.fill"),
                     for: .selected
        )
        
        return btn
    }()
    
    private lazy var posterImageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.backgroundColor = .lightGray
        imageView.layer.cornerRadius = 10
        imageView.layer.shadowOpacity = 0.5
        imageView.layer.shadowColor = UIColor.black.cgColor
        imageView.layer.shadowRadius = 5
        imageView.layer.shadowOffset = CGSize(width: 4, height: 4)
        
        return imageView
    }()
    
    private lazy var userNameLabel: UILabel = {
        let label = UILabel()
        
        label.font = .ngaH3Sb
        label.textColor = .black
        label.text = "테스트님"
        
        return label
    }()
    
    private lazy var recommendLabel: UILabel = {
        let label = UILabel()
        
        label.font = .ngaSubTitle1R
        label.textColor = .black
        label.text = "오늘의 추천테마를 즐겨보세요!"
        
        return label
    }()
    
    private lazy var labelStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 4
        
        return stackView
    }()
    
    private lazy var pushButton: UIButton = {
        let btn = UIButton()
        
        btn.setImage(UIImage(systemName: "chevron.right"),
                     for: .normal
        )
        
        return btn
    }()
    
    override func makeUI() {
        // TODO: 이미지에 따른 추천 색상으로 변경
        let middleColor = UIColor.systemPink
        self.backgroundColor = middleColor
        
        labelStackView.addArrangedSubviews([
            userNameLabel,
            recommendLabel
        ])
        
        self.addSubviews([
            recommandThemeBackgroundTopGradientView,
            recommandThemeBackgroundBottomGradientView,
            posterImageView,
            heartIcon,
            labelStackView,
            pushButton
        ])
        
        posterImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(40).priority(.high)
            $0.bottom.equalToSuperview().inset(50).priority(.high)
        }
        
        heartIcon.snp.makeConstraints {
            $0.trailing.equalTo(posterImageView.snp.trailing).inset(20)
            $0.top.equalTo(posterImageView.snp.top).inset(20)
        }
        
        labelStackView.snp.makeConstraints {
            $0.leading.equalTo(posterImageView.snp.leading).inset(24)
            $0.bottom.equalTo(posterImageView.snp.bottom).inset(24)
        }
        
        pushButton.snp.makeConstraints {
            $0.trailing.equalTo(posterImageView.snp.trailing).inset(16)
            $0.centerY.equalTo(labelStackView.snp.centerY)
        }
    }
    
    override func adjustLayoutAfterRendering() {
        let gradientHeight = self.bounds.height / 2
        
        let topGradientFrame = CGRect(
            x: 0,
            y: 0,
            width: self.bounds.width,
            height: gradientHeight
        )
        recommandThemeBackgroundTopGradientView.frame = topGradientFrame
        recommandThemeBackgroundTopGradientView.makeGradient(colors: [
            .black,
            UIColor(white: 0, alpha: 0)
        ])
        
        let bottomGradientFrame = CGRect(
            x: 0,
            y: self.bounds.height - gradientHeight,
            width: self.bounds.width,
            height: gradientHeight
        )
        recommandThemeBackgroundBottomGradientView.frame = bottomGradientFrame
        recommandThemeBackgroundBottomGradientView.backgroundColor = .clear
        recommandThemeBackgroundBottomGradientView.makeGradient(colors: [
            UIColor(white: 1, alpha: 0),
            .white
        ])
    }
    
    @objc private func heartTapped(_ sender: UIButton) {
        sender.isSelected.toggle()
    }
}
