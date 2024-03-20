//
//  BadgeIconView.swift
//  Nagaza
//
//  Created by 강조은 on 2024/01/08.
//

import UIKit

import SnapKit
// TODO: - Swift Version 차이로 return 붙여줘야함.(맞추거나 삭제)
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
            return "진흙길"
        case .soil:
            return "흙길"
        case .grass:
            return "풀밭길"
        case .flower:
            return "꽃길"
        case .flowerGarden:
            return "꽃밭길"
        case .life:
            return "인생테마"
        }
    }
    
    var textColor: UIColor {
        switch self {
        case .mud:
            return NagazaAsset.Colors.darkbrownMudText.color
        case .soil:
            return NagazaAsset.Colors.brownSoilText.color
        case .grass:
            return NagazaAsset.Colors.greenGrassText.color
        case .flower:
            return NagazaAsset.Colors.blueFlowerText.color
        case .flowerGarden:
            return NagazaAsset.Colors.pinkFlowerText.color
        case .life:
            return NagazaAsset.Colors.darkbrownMudText.color
        }
    }
    
    var backgrouncColor: UIColor {
        switch self {
        case .mud:
            return NagazaAsset.Colors.darkbrownMudBackground.color
        case .soil:
            return NagazaAsset.Colors.brownSoilBackground.color
        case .grass:
            return NagazaAsset.Colors.greenGrassBackground.color
        case .flower:
            return NagazaAsset.Colors.blueFlowerBackground.color
        case .flowerGarden:
            return NagazaAsset.Colors.pinkFlowerBackground.color
        case .life:
            return NagazaAsset.Colors.yellowLifeBackground.color
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
