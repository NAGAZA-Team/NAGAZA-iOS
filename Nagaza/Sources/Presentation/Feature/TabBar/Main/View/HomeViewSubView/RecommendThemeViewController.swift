//
//  RecommendThemeViewController.swift
//  Nagaza
//
//  Created by 전성훈 on 2023/12/01.
//

import UIKit

import RxSwift
import SnapKit

final class RecommendThemeViewController: NagazaBaseViewController {
    private var viewModel: HomeViewModel!
    
    private lazy var heartIcon: UIButton = {
        let btn = UIButton()
        
        return btn
    }()
    
    private lazy var posterImageView: UIImageView = {
        let imageView = UIImageView()
        
        return imageView
    }()
    
    private lazy var userNameLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    private lazy var recommendLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    private lazy var pushButton: UIButton = {
        let btn = UIButton()
        
        return btn
    }()
    
    static func create(with viewModel: HomeViewModel) -> RecommendThemeViewController {
        let vc = RecommendThemeViewController()
        vc.viewModel = viewModel
        
        return vc
    }
    
    override func makeUI() {
        
    }
    
    override func bindViewModel() {
        
    }
}
