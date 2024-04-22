//
//  MapSearchView.swift
//  Nagaza
//
//  Created by SeungMin on 3/14/24.
//

import UIKit

final class MapSearchView: NagazaView {
    lazy var textLabel: UILabel = {
        let label = UILabel()
        label.text = "검색어를 입력하세요"
        label.font = UIFont.ngaSubTitle2R
        label.textAlignment = .left
        label.textColor = NagazaAsset.Colors.gray4.color
        return label
    }()
    
    lazy var searchImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = NagazaAsset.Images.imgSearch.image
        return imageView
    }()
    
    override func makeUI() {
        self.backgroundColor = NagazaAsset.Colors.white.color
        self.layer.cornerRadius = 15
        self.clipsToBounds = true
        
        self.addSubview(searchImageView)
        searchImageView.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(23)
            $0.centerY.equalToSuperview()
            $0.width.height.equalTo(24)
        }
        
        self.addSubview(textLabel)
        textLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(22)
            $0.trailing.equalTo(searchImageView.snp.leading).offset(-16)
            $0.centerY.equalToSuperview()
        }
    }
}
