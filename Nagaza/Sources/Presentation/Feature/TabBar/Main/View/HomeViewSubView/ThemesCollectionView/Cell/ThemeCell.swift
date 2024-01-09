//
//  HomeThemeCell.swift
//  Nagaza
//
//  Created by 전성훈 on 2023/12/01.
//

import UIKit

import SnapKit
import RxSwift

final class ThemeCell: UICollectionViewCell {
    static let identifier = String(describing: ThemeCell.self)
    
    private var model: Room?
    
    private lazy var posterImageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.layer.cornerRadius = 10
        imageView.backgroundColor = .lightGray
        imageView.layer.cornerRadius = 10
        imageView.layer.shadowOpacity = 0.5
        imageView.layer.shadowColor = UIColor.black.cgColor
        imageView.layer.shadowRadius = 5
        imageView.layer.shadowOffset = CGSize(width: 4, height: 4)
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    private lazy var newIcon: UIImageView = {
        let imageView = UIImageView()
        
        
        return imageView
    }()
    
    private lazy var heartButton: UIButton = {
        let btn = UIButton()
        
        
        return btn
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        
        label.font = .ngaP1Sb
        label.textColor = .black
        
        return label
    }()
    
    private lazy var branchLabel: UILabel = {
        let label = UILabel()
        
        label.font = .ngaCaption1M
        label.textColor = .gray
        
        return label
    }()
    
    private lazy var starIcon: UIImageView = {
        let imageView = UIImageView()
        
        
        return imageView
    }()
    
    private lazy var ratedLabel: UILabel = {
        let label = UILabel()
        
        label.font = .ngaCaption1M
        label.textColor = .gray
        
        return label
    }()
    
    private lazy var starAndRatedStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.axis = .horizontal
        stackView.spacing = 2
        stackView.distribution = .fill
        
        return stackView
    }()
    
    
    private lazy var categoryIcon: UIImageView = {
        let imageView = UIImageView()
        
        return imageView
    }()
    
    private lazy var ratedAndCategoryStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
    
        return stackView
    }()
    
    private lazy var textStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.axis = .vertical
        stackView.spacing = 2
        stackView.alignment = .leading
        stackView.distribution = .fillEqually
        
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        makeUI()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.titleLabel.text = nil
        self.branchLabel.text = nil
        self.ratedLabel.text = nil
        self.posterImageView.image = nil
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func makeUI() {
        starAndRatedStackView.addArrangedSubviews([
            starIcon,
            ratedLabel
        ])
        
        ratedAndCategoryStackView.addArrangedSubviews([
            starAndRatedStackView,
            categoryIcon
        ])
        
        textStackView.addArrangedSubviews([
            titleLabel,
            branchLabel,
            ratedAndCategoryStackView
        ])
        
        contentView.addSubviews([
            posterImageView,
            newIcon,
            heartButton,
            textStackView
        ])
        
        posterImageView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(146)
        }
        
        newIcon.snp.makeConstraints {
            $0.leading.equalTo(posterImageView).inset(5)
            $0.bottom.equalTo(posterImageView).inset(6)
        }
        
        heartButton.snp.makeConstraints {
            $0.trailing.equalTo(posterImageView).inset(5)
            $0.bottom.equalTo(posterImageView).inset(5)
        }
        
        textStackView.snp.makeConstraints {
            $0.top.equalTo(posterImageView.snp.bottom).offset(10)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    func bind(with model: Room) {
        self.model = model
        
        updateInfo()
        updatePosterImage()
    }
    
    private func updateInfo() {
        guard let model = model else { return }
        self.titleLabel.text = model.name
        self.branchLabel.text = model.area
        self.ratedLabel.text = String(model.total)
        self.posterImageView.loadImage(from: model.imageUrlString)
    }
    
    private func updatePosterImage() {
        
    }
}
