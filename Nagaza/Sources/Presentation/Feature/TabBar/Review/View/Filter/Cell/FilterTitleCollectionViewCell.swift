//
//  FilterTitleCollectionViewCell.swift
//  Nagaza
//
//  Created by 강조은 on 2/18/24.
//

import UIKit

import SnapKit

final class FilterTitleCollectionViewCell: UICollectionViewCell {
    static let identifier = FilterTitleCollectionView.description()
    
    static func fittingSize(availableHeight: CGFloat, name: String?) -> CGSize {
        let cell = FilterTitleCollectionViewCell()
        cell.configure(name: name)
        
        let targetSize = CGSize(width: UIView.layoutFittingCompressedSize.width, height: availableHeight)
        return cell.contentView.systemLayoutSizeFitting(targetSize,
                                                        withHorizontalFittingPriority: .fittingSizeLevel, verticalFittingPriority: .required)
    }
    
    private lazy var contentsView: UIView = {
        let view = UIView()
        
        view.backgroundColor = .gray
        view.layer.cornerRadius = 10
        
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        
        label.textColor = NagazaAsset.Colors.gray3.color
        label.font = NagazaFontFamily.Pretendard.medium.font(size: 10)
        
        return label
    }()
    
    private lazy var arrowImageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.image = NagazaAsset.Images.icArrowBottomGray.image
        
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setupLayout()
        setupAttribute()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    private func setupView() {
        contentView.addSubview(contentsView)
        contentsView.addSubviews([titleLabel,
                                  arrowImageView])
    }
    
    private func setupLayout() {
        contentsView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints { make in
            make.verticalEdges.equalToSuperview().inset(5)
            make.leading.equalToSuperview().inset(12)
            make.trailing.equalTo(arrowImageView.snp.leading).offset(-2)
        }
        
        arrowImageView.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(8)
            make.centerY.equalToSuperview()
            make.size.equalTo(14)
        }
    }
    
    private func setupAttribute() {
        contentsView.backgroundColor = NagazaAsset.Colors.gray8.color
    }
    
    func configure(name: String?) {
        titleLabel.text = name
    }
}
