//
//  BadgeIconView.swift
//  Nagaza
//
//  Created by 강조은 on 2024/01/08.
//

import UIKit

import SnapKit

final class BadgeIconView: NagazaBaseView {
    let titleText: UILabel = {
        let label = UILabel()
        label.font = NagazaFontFamily.Pretendard.medium.font(size: 8)
        return label
    }()
    
    convenience init(type: BadgeIconType) {
        self.init()
        
        switch type {
        case .mud:
            titleText.text = "진흙길"
            titleText.textColor = NagazaAsset.Colors.darkbrownMudText.color
            backgroundColor = NagazaAsset.Colors.darkbrownMudBackground.color
            
        case .soil:
            titleText.text = "흙길"
            titleText.textColor = NagazaAsset.Colors.brownSoilText.color
            backgroundColor = NagazaAsset.Colors.brownSoilBackground.color
            
        case .grass:
            titleText.text = "풀밭길"
            titleText.textColor = NagazaAsset.Colors.greenGrassText.color
            backgroundColor = NagazaAsset.Colors.greenGrassBackground.color
            
        case .flower:
            titleText.text = "꽃길"
            titleText.textColor = NagazaAsset.Colors.blueFlowerText.color
            backgroundColor = NagazaAsset.Colors.blueFlowerBackground.color
            
        case .flowerGarden:
            titleText.text = "꽃밭길"
            titleText.textColor = NagazaAsset.Colors.pinkFlowerText.color
            backgroundColor = NagazaAsset.Colors.pinkFlowerBackground.color
            
        case .life:
            titleText.text = "인생테마"
            titleText.textColor = NagazaAsset.Colors.darkbrownMudText.color
            backgroundColor = NagazaAsset.Colors.yellowLifeBackground.color
        }
    }
    
    override func makeUI() {
        layer.cornerRadius = 8
        initSubviews()
        initConstraints()
    }
    private func initSubviews() {
        addSubview(titleText)
    }
    
    private func initConstraints() {
        titleText.snp.makeConstraints { make in
            make.top.equalTo(snp.top).offset(3)
            make.left.equalTo(snp.left).offset(6)
            make.right.equalTo(snp.right).offset(-6)
            make.bottom.equalTo(snp.bottom).offset(-3)
        }
    }
}

enum BadgeIconType {
    case mud
    case soil
    case grass
    case flower
    case flowerGarden
    case life
}
