//
//  MainRegionTableViewCell.swift
//  Nagaza
//
//  Created by 전성훈 on 2024/02/20.
//

import UIKit

import SnapKit

final class MainRegionTableViewCell: UITableViewCell {
    static let identifier = MainRegionTableViewCell.description()
    
    private lazy var regionLabel: UILabel = {
        let lbl = UILabel()
        
        lbl.textAlignment = .center
        lbl.numberOfLines = 1
        lbl.font = .ngaSubTitle1Sb
        
        return lbl
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func prepareForReuse() {
        self.backgroundColor = NagazaAsset.Colors.gray8.color
        regionLabel.text = ""
    }
    
    private func setupLayout() {
        [
            regionLabel
        ].forEach {
            self.contentView.addSubview($0)
        }
        
        regionLabel.snp.makeConstraints {
            $0.width.equalToSuperview()
            $0.height.equalToSuperview()
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
    }
    
    func bind(region: MainRegion) {
        regionLabel.text = region.region.title
        
        self.backgroundColor = region.isSelected ? NagazaAsset.Colors.white.color :  NagazaAsset.Colors.gray8.color
    }

}
