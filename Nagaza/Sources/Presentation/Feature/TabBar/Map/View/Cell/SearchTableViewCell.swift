//
//  SearchTableViewCell.swift
//  Nagaza
//
//  Created by SeungMin on 3/13/24.
//

import UIKit

final class SearchTableViewCell: NagazaTableViewCell {
    static let identifier = SearchTableViewCell.description()

    lazy var labelStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 6
        stackView.alignment = .leading
        return stackView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.ngaSubTitle1R
        label.textAlignment = .center
        label.textColor = NagazaAsset.Colors.black1.color
        return label
    }()
    
    lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.ngaP1R
        label.textAlignment = .center
        label.textColor = NagazaAsset.Colors.gray3.color
        return label
    }()
    
    override func makeUI() {
        contentView.addSubview(labelStackView)
        
        labelStackView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(35)
            $0.centerY.equalToSuperview()
        }
        
        labelStackView.addArrangedSubviews(
            [titleLabel, subtitleLabel]
        )
    }
    
    func bind(item: Place, keyword: String?) {
        titleLabel.attributedText = item.placeName.toAttributedString(
            with: keyword,
            font: UIFont.ngaSubTitle1B,
            color: NagazaAsset.Colors.mainOrange.color
        )
        subtitleLabel.text = item.addressName
    }
}
