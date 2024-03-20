//
//  BadgeIconView.swift
//  Nagaza
//
//  Created by 강조은 on 2024/01/08.
//

import UIKit

import SnapKit

enum BadgeIconType {
    case mud
    case soil
    case grass
    case flower
    case flowerGarden
    case life
    
    var title: String {
        switch self {
        case .mud:
            "진흙길"
        case .soil:
            "흙길"
        case .grass:
            "풀밭길"
        case .flower:
            "꽃길"
        case .flowerGarden:
            "꽃밭길"
        case .life:
            "인생테마"
        }
    }
    
    var textColor: UIColor {
        switch self {
        case .mud:
            NagazaAsset.Colors.darkbrownMudText.color
        case .soil:
            NagazaAsset.Colors.brownSoilText.color
        case .grass:
            NagazaAsset.Colors.greenGrassText.color
        case .flower:
            NagazaAsset.Colors.blueFlowerText.color
        case .flowerGarden:
            NagazaAsset.Colors.pinkFlowerText.color
        case .life:
            NagazaAsset.Colors.darkbrownMudText.color
        }
    }
    
    var backgrouncColor: UIColor {
        switch self {
        case .mud:
            NagazaAsset.Colors.darkbrownMudBackground.color
        case .soil:
            NagazaAsset.Colors.brownSoilBackground.color
        case .grass:
            NagazaAsset.Colors.greenGrassBackground.color
        case .flower:
            NagazaAsset.Colors.blueFlowerBackground.color
        case .flowerGarden:
            NagazaAsset.Colors.pinkFlowerBackground.color
        case .life:
            NagazaAsset.Colors.yellowLifeBackground.color
        }
    }
}

final class BadgeIconView: NagazaBaseView {
    private let titleText: UILabel = {
        let label = UILabel()
        
        label.font = NagazaFontFamily.Pretendard.medium.font(size: 8)
        
        return label
    }()
    
    convenience init(type: BadgeIconType) {
        self.init()
        
        setupType(with: type)
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
            make.verticalEdges.equalToSuperview().inset(3)
            make.horizontalEdges.equalToSuperview().inset(6)
        }
    }
    
    private func setupType(with type: BadgeIconType) {
        titleText.text = type.title
        titleText.textColor = type.textColor
        
        self.backgroundColor = type.backgrouncColor
    }
}
