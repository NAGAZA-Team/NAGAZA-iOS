//
//  SearchHeaderView.swift
//  Nagaza
//
//  Created by SeungMin on 3/14/24.
//

import UIKit

final class SearchHeaderView: UICollectionReusableView {
    private lazy var recentTextLabel: UILabel = {
        let label = UILabel()
        label.text = "최근 검색"
        label.font = UIFont.ngaSubTitle2B
        label.textAlignment = .center
        label.textColor = NagazaAsset.Colors.black.color
        return label
    }()
    
    private lazy var removaAllButton: UIButton = {
        let button = UIButton()
        button.setAttributedTitle(NSAttributedString(string: "모두 지우기", attributes: [
            NSAttributedString.Key.font: UIFont.ngaSubTitle2B
            
        ]), for: .normal)
        button.setTitleColor(NagazaAsset.Colors.gray3.color, for: .normal)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        makeUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func makeUI() {
        addSubview(recentTextLabel)
        recentTextLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(24)
            $0.centerY.equalToSuperview()
        }
        
        addSubview(removaAllButton)
        removaAllButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(21)
            $0.centerY.equalToSuperview()
        }
    }
}
