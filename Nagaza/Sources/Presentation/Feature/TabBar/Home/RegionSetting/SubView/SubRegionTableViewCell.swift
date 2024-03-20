//
//  SubRegionTableViewCell.swift
//  Nagaza
//
//  Created by 전성훈 on 2024/02/20.
//

import UIKit

import SnapKit

final class SubRegionTableViewCell: UITableViewCell {
    static let identifier = MainRegionTableViewCell.description()

    private lazy var regionLabel: UILabel = {
        let lbl = UILabel()
        
        lbl.textAlignment = .center
        lbl.numberOfLines = 1
        lbl.font = .ngaSubTitle1Sb
        
        return lbl
    }()
    
    // TODO: - 아이콘 추가 예정
    private lazy var countLabel: UILabel = {
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
        regionLabel.text = ""
        countLabel.text = ""
    }
    
    private func setupLayout() {
        [
            regionLabel,
            countLabel
        ].forEach {
            self.contentView.addSubview($0)
        }
        
        regionLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(30)
            $0.centerY.equalToSuperview()
        }
        
        countLabel.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(16)
            $0.centerY.equalToSuperview()
            $0.leading.greaterThanOrEqualTo(regionLabel.snp.trailing).inset(16)
        }
    }
    
    func bind(region: SubRegion) {
        regionLabel.text = region.region
        
        if let themeCount = region.themeCount {
            countLabel.text = "\(themeCount)" + " >"
        }
    }
}
