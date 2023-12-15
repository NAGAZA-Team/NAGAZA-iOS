//
//  SplashView.swift
//  Nagaza
//
//  Created by SeungMin on 2023/11/01.
//

import UIKit

final class SplashView: NagazaBaseView {
    let imageView: UIImageView = {
        let imageView = UIImageView(image: NagazaAsset.Images.imgLaunch.image)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override func makeUI() {
        backgroundColor = .white
        
        self.addSubview(imageView)
        imageView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
    }
}
