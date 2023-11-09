//
//  TabBarButton.swift
//  Nagaza
//
//  Created by 전성훈 on 2023/11/07.
//

import UIKit

final class TabBarButton: UIButton {
    
    init(tabBarType: TabBarType) {
        super.init(frame: .zero)
        var config = defaultButtonConfig()
        config.attributedTitle = AttributedString(tabBarType.title, attributes: AttributeContainer([NSAttributedString.Key.font : UIFont.ngaCaption3M]))
        config.image = tabBarType.icon
        config.imagePadding = 4
        
        configuration = config
        
        configurationUpdateHandler = { button in
            switch self.state {
            case .selected:
                button.configuration?.imageColorTransformer = UIConfigurationColorTransformer({ _ in NagazaAsset.Colors.orange.color })
                button.configuration?.attributedTitle?.foregroundColor = NagazaAsset.Colors.selected.color
            default:
                button.configuration?.imageColorTransformer = UIConfigurationColorTransformer({ _ in NagazaAsset.Colors.normal.color })
                button.configuration?.attributedTitle?.foregroundColor = NagazaAsset.Colors.normal.color
            }
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func defaultButtonConfig() -> UIButton.Configuration {
        var config = UIButton.Configuration.plain()
        config.cornerStyle = .capsule
        config.baseBackgroundColor = .clear
        config.imagePlacement = .top
        return config
    }
}
