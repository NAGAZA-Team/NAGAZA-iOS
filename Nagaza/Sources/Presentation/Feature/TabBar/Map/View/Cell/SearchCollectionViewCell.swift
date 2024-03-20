//
//  SearchCollectionViewCell.swift
//  Nagaza
//
//  Created by SeungMin on 3/13/24.
//

import UIKit

final class SearchCollectionViewCell: NagazaCollectionViewCell {
    lazy var textLabel: UILabel = {
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
        contentView.addSubview(textLabel)
        contentView.addSubview(removeButton)
        
        textLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(35)
            $0.centerY.equalToSuperview()
        }
        
        removeButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(20)
            $0.centerY.equalToSuperview()
        }
    }
    
    func bind(item: RecentKeyword) {
        textLabel.text = item.keyword
    }
}
