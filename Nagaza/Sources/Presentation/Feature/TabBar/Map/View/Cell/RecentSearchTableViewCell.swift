//
//  RecentSearchTableViewCell.swift
//  Nagaza
//
//  Created by SeungMin on 3/27/24.
//

import UIKit

final class RecentSearchTableViewCell: NagazaTableViewCell {
    static let identifier = RecentSearchTableViewCell.description()

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.ngaSubTitle1R
        label.textAlignment = .center
        label.textColor = NagazaAsset.Colors.black1.color
        return label
    }()
    
    lazy var removeButton: UIButton = {
        let button = UIButton()
        button.setImage(NagazaAsset.Images.icX.image, for: .normal)
        return button
    }()
    
    override func makeUI() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(removeButton)
        
        titleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(35)
            $0.centerY.equalToSuperview()
        }
        
        removeButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(20)
            $0.centerY.equalToSuperview()
        }
    }
    
    func bind(item: RecentKeyword) {
        titleLabel.text = item.keyword
    }
}

