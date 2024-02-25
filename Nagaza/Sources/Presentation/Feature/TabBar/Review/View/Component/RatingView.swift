//
//  RatingView.swift
//  Nagaza
//
//  Created by 강조은 on 2024/01/08.
//

import UIKit

final class RatingView: NagazaBaseView {
    let starImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = NagazaAsset.Images.icStar.image
        return imageView
    }()
    
    let ratingLabel: UILabel = {
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
        initSubviews()
        initConstraints()
    }
    
    private func initSubviews() {
        addSubviews([starImageView,
                    ratingLabel])
    }
    
    private func initConstraints() {
        starImageView.snp.makeConstraints { make in
            make.top.equalTo(snp.top)
            make.left.equalTo(snp.left)
            make.right.equalTo(ratingLabel.snp.left).offset(-3)
            make.bottom.equalTo(snp.bottom)
            make.width.equalTo(15)
            make.height.equalTo(15)
        }
        
        ratingLabel.snp.makeConstraints { make in
            make.top.equalTo(snp.top)
            make.right.equalTo(snp.right)
            make.bottom.equalTo(snp.bottom)
        }
    }
}
