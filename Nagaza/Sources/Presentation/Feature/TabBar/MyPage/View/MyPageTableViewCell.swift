//
//  MyPageTableViewCell.swift
//  Nagaza
//
//  Created by 강조은 on 3/10/24.
//

import UIKit

final class MyPageTableViewCell: UITableViewCell {
    
    static let identifier = MyPageTableViewCell.description()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = NagazaFontFamily.Pretendard.regular.font(size: 16)
        label.textColor = NagazaAsset.Colors.black1.color
        return label
    }()
    
    private let countLabel: UILabel = {
        let label = UILabel()
        label.font = NagazaFontFamily.Pretendard.regular.font(size: 15)
        label.textColor = NagazaAsset.Colors.mainOrange.color
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle,
                  reuseIdentifier: String?) {
        super.init(style: style,
                   reuseIdentifier: reuseIdentifier)
        
        setup()
        initConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        contentView.addSubviews([titleLabel, countLabel])
    }
    
    private func initConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(20)
            make.leading.equalToSuperview().inset(24)
            make.centerY.equalToSuperview()
        }
        
        countLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(24)
        }
    }
    
    func config(item: MypageInfo) {
        titleLabel.text = item.title
        if let count = item.count {
            countLabel.text = "\(count)"
        }
    }
}
