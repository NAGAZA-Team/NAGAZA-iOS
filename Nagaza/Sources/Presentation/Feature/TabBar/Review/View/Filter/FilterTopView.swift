//
//  FilterTopView.swift
//  Nagaza
//
//  Created by 강조은 on 2/18/24.
//

import UIKit

import SnapKit

final class FilterTopView: NagazaBaseView {
    
    private var filterTitleCollectionView: FilterTitleCollectionView = {
        let view = FilterTitleCollectionView()
        return view
    }()
    
    // TODO: 추후 작성 예정
    private let filterContentsView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    private let resetButtonLabel: UILabel = {
        let label = UILabel()
        label.text = "초기화"
        label.textColor = NagazaAsset.Colors.gray1.color
        label.font = NagazaFontFamily.Pretendard.medium.font(size: 15)
        label.textAlignment = .center
        return label
    }()
    
    private let applyButtonLabel: UILabel = {
        let label = UILabel()
        label.text = "적용"
        label.textColor = .white
        label.font = NagazaFontFamily.Pretendard.medium.font(size: 15)
        label.textAlignment = .center
        return label
    }()
    
    private let resetButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = NagazaAsset.Colors.gray8.color
        button.layer.borderColor = NagazaAsset.Colors.gray3.color.cgColor
        button.layer.borderWidth = 1
        return button
    }()
    
    private let applyButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = NagazaAsset.Colors.mainOrange.color
        button.layer.borderColor = NagazaAsset.Colors.gray3.color.cgColor
        button.layer.borderWidth = 1
        return button
    }()
    
    private let buttonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        return stackView
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 0
        stackView.axis = .vertical
        return stackView
    }()
    
    override func makeUI() {
        setup()
        initConstraints()
    }
    
    private func setup() {
        addSubview(stackView)
        stackView.addArrangedSubviews([filterTitleCollectionView,
                                       filterContentsView,
                                       buttonStackView])
        
        buttonStackView.addArrangedSubviews([resetButton,
                                             applyButton])
        
        resetButton.addSubview(resetButtonLabel)
        applyButton.addSubview(applyButtonLabel)
    }
    
    private func initConstraints() {
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        filterTitleCollectionView.snp.makeConstraints { make in
            make.height.equalTo(40)
        }
        
        filterContentsView.snp.makeConstraints { make in
            make.height.equalTo(80)
        }
        
        buttonStackView.snp.makeConstraints { make in
            make.height.equalTo(40)
        }
        
        resetButtonLabel.snp.makeConstraints { make in
            make.verticalEdges.equalToSuperview().inset(12)
            make.horizontalEdges.equalTo(resetButton)
        }
        
        applyButtonLabel.snp.makeConstraints { make in
            make.verticalEdges.equalToSuperview().inset(12)
            make.horizontalEdges.equalToSuperview()
        }
    }
}
