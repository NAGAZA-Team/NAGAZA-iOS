//
//  SettingTableViewCell.swift
//  MyPage
//
//  Created by 강조은 on 7/29/24.
//

import UIKit
import DSKit

final class SettingTableViewCell: NagazaTableViewCell {
    static let identifier = SettingTableViewCell.description()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "임시 텍스트"
        label.font = DSKitFontFamily.Pretendard.regular.font(size: 16)
        label.textColor = DSKitColors.Color.black
        return label
    }()
    
    override func makeUI() {
        super.makeUI()
        contentView.addSubview(titleLabel)
    }
    
    override func setConstraints() {
        super.setConstraints()
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().inset(24)
        }
    }
    
    // TODO: 추후 타입도 함께 전달
    func configure(text: String) {
        titleLabel.text = text
    }
}
