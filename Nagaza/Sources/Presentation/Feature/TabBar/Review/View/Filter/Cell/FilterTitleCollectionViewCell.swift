//
//  FilterTitleCollectionViewCell.swift
//  Nagaza
//
//  Created by 강조은 on 2/18/24.
//

import UIKit

import SnapKit

final class FilterTitleCollectionViewCell: UICollectionViewCell {
    static func fittingSize(availableHeight: CGFloat, name: String?) -> CGSize {
        let cell = FilterTitleCollectionViewCell()
        cell.configure(name: name)
        
        let targetSize = CGSize(width: UIView.layoutFittingCompressedSize.width, height: availableHeight)
        return cell.contentView.systemLayoutSizeFitting(targetSize,
                                                        withHorizontalFittingPriority: .fittingSizeLevel, verticalFittingPriority: .required)
    }
    
    func configure(name: String?) {
        titleLabel.text = name
    }
    
    static let identifier = "FilterTitleCollectionViewCell"
    
    let contentsView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        view.layer.cornerRadius = 10
        return view
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = NagazaAsset.Colors.gray3.color
        label.font = NagazaFontFamily.Pretendard.medium.font(size: 10)
        return label
    }()
    
    let arrowImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = NagazaAsset.Images.icArrowBottomGray.image
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentsView.backgroundColor = NagazaAsset.Colors.gray8.color
        initSubviews()
        initConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initSubviews() {
        
        contentView.addSubview(contentsView)
        contentsView.addSubviews([titleLabel,
                                  arrowImageView])
    }
    
    private func initConstraints() {
        contentsView.snp.makeConstraints { make in
            make.edges.equalTo(contentView)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(contentsView.snp.top).offset(5)
            make.left.equalTo(contentsView.snp.left).offset(12)
            make.right.equalTo(arrowImageView.snp.left).offset(-2)
            make.bottom.equalTo(contentsView.snp.bottom).offset(-5)
        }
        
        arrowImageView.snp.makeConstraints { make in
            make.right.equalTo(contentsView.snp.right).offset(-8)
            make.centerY.equalTo(contentsView.snp.centerY)
            make.width.equalTo(14)
            make.height.equalTo(14)
        }
    }
}
