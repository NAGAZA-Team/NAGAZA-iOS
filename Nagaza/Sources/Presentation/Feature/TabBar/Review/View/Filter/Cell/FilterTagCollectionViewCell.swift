//
//  FilterTagCollectionViewCell.swift
//  Nagaza
//
//  Created by 강조은 on 2024/01/30.
//

import UIKit

import SnapKit

final class FilterTagCollectionViewCell: UICollectionViewCell {
    static let identifier = FilterTagCollectionViewCell.description()
    
    static func fittingSize(availableHeight: CGFloat, name: String?) -> CGSize {
        let cell = FilterTagCollectionViewCell()
        cell.configure(name: name)
        
        let targetSize = CGSize(width: UIView.layoutFittingCompressedSize.width, height: availableHeight)
        return cell.contentView.systemLayoutSizeFitting(targetSize,
                                                        withHorizontalFittingPriority: .fittingSizeLevel, verticalFittingPriority: .required)
    }
    
    private lazy var contentsView: UIView = {
        let view = UIView()
        
        view.backgroundColor = .gray
        
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        
        label.textColor = NagazaAsset.Colors.gray3.color
        label.font = NagazaFontFamily.Pretendard.medium.font(size: 10)
        
        return label
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
        contentsView.addSubview(titleLabel)
    }
    
    private func setupLayout() {
        contentsView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints { make in
            make.verticalEdges.equalToSuperview().inset(5)
            make.horizontalEdges.equalToSuperview().inset(10)
        }
    }
    
    private func setupAttribute() {
        contentsView.backgroundColor = .white
        contentsView.layer.borderWidth = 1
        contentsView.layer.cornerRadius = 10
        contentsView.layer.borderColor = NagazaAsset.Colors.gray5.color.cgColor
    }
    
    func configure(name: String?) {
        titleLabel.text = name
    }
}
