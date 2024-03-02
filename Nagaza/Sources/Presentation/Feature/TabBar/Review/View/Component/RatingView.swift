//
//  RatingView.swift
//  Nagaza
//
//  Created by 강조은 on 2024/01/08.
//

import UIKit

final class RatingView: NagazaBaseView {
    private let starImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = NagazaAsset.Images.icStar.image
        return imageView
    }()
    
    private let ratingLabel: UILabel = {
        let label = UILabel()
        label.font = NagazaFontFamily.Pretendard.regular.font(size: 16)
        label.textColor = NagazaAsset.Colors.gray3.color
        label.text = "3.2"
        return label
    }()
    
    func setupRatingLabelText(text: String) {
        ratingLabel.text = text
    }
    
    override func makeUI() {
        setup()
        initConstraints()
    }
    
    private func setup() {
        addSubviews([starImageView,
                     ratingLabel])
    }
    
    private func initConstraints() {
        starImageView.snp.makeConstraints { make in
            make.top.leading.bottom.equalToSuperview()
            make.trailing.equalTo(ratingLabel.snp.leading).offset(-3)
            make.size.equalTo(15)
        }
        
        ratingLabel.snp.makeConstraints { make in
            make.top.trailing.bottom.equalToSuperview()
        }
    }
}
