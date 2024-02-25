//
//  FilterTagCollectionViewCell.swift
//  Nagaza
//
//  Created by 강조은 on 2024/01/30.
//

import UIKit

import SnapKit

final class FilterTagCollectionViewCell: UICollectionViewCell {
    static func fittingSize(availableHeight: CGFloat, name: String?) -> CGSize {
        let cell = FilterTagCollectionViewCell()
        cell.configure(name: name)
        
        let targetSize = CGSize(width: UIView.layoutFittingCompressedSize.width, height: availableHeight)
        return cell.contentView.systemLayoutSizeFitting(targetSize,
                                                        withHorizontalFittingPriority: .fittingSizeLevel, verticalFittingPriority: .required)
    }
    
    func configure(name: String?) {
        titleLabel.text = name
    }
    
    static let identifier = "FilterTagCollectionViewCell"
    
    let contentsView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        return view
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = NagazaAsset.Colors.gray3.color
        label.font = NagazaFontFamily.Pretendard.medium.font(size: 10)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentsView.backgroundColor = .white
        contentsView.layer.borderWidth = 1
        contentsView.layer.cornerRadius = 10
        contentsView.layer.borderColor = NagazaAsset.Colors.gray5.color.cgColor
        initSubviews()
        initConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initSubviews() {
        
        contentView.addSubview(contentsView)
        contentsView.addSubview(titleLabel)
    }
    
    private func initConstraints() {
        
        contentsView.snp.makeConstraints { make in
            make.edges.equalTo(contentView)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(contentsView.snp.top).offset(5)
            make.left.equalTo(contentsView.snp.left).offset(10)
            make.right.equalTo(contentsView.snp.right).offset(-10)
            make.bottom.equalTo(contentsView.snp.bottom).offset(-5)
        }
    }
}
