//
//  ThemesViewController.swift
//  Nagaza
//
//  Created by 전성훈 on 2023/12/01.
//

import UIKit

import SnapKit
import RxSwift

final class HomeThemesViewController: NagazaBaseViewController {
    private var viewModel: HomeViewModel!
    
    private var themesCollectionViewController: HomeThemesCollectionViewController?
    
    private lazy var themeLabel: UILabel = {
        let label = UILabel()
        
        label.text = "테스트입니다."
        
        return label
    }()
    
    private lazy var pushButton: UIButton = {
        let btn = UIButton()
        
        return btn
    }()
    
    private lazy var collectionViewContainer: UIView = {
        let view = UIView()
        
        themesCollectionViewController =  HomeThemesCollectionViewController.create(with: viewModel)
        
        if let themes = themesCollectionViewController {
            add(child: themes, container: view)
            view.addSubview(themes.view)
        }
        
        return view
    }()
    
    static func create(with viewModel: HomeViewModel) -> HomeThemesViewController {
        let vc = HomeThemesViewController()
        vc.viewModel = viewModel
        
        return vc
    }
    
    override func makeUI() {
        
    }
    
    override func bindViewModel() {
        
    }
}
