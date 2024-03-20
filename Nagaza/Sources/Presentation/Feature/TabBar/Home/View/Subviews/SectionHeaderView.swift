//
//  SectionHeaderView.swift
//  Nagaza
//
//  Created by SeungMin on 1/9/24.
//

import UIKit

final class SectionHeaderView: UICollectionReusableView {
    lazy var themeLabel: UILabel = {
        let label = UILabel()

        label.font = .ngaSubTitle2M
        // TODO: 변경 예정
        label.textColor = .black
        return label
    }()
    
    lazy var pushButton: UIButton = {
        let btn = UIButton()
        
        // TODO: 변경 예정
        btn.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        makeUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func makeUI() {
        self.addSubviews([
            themeLabel,
            pushButton,
        ])
        
        themeLabel.snp.makeConstraints {
            $0.leading.centerY.equalTo(self)
        }
        
        pushButton.snp.makeConstraints {
            $0.trailing.centerY.equalTo(self)
        }
    }
}
