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
    
    lazy var themesCollectionViewController: HomeThemesCollectionViewController = {
        let vc = HomeThemesCollectionViewController.create(with: viewModel)
        return vc
    }()
    
    private lazy var collectionViewContainer: UIView = {
        let view = UIView()
        add(child: themesCollectionViewController, container: view)
        
        return view
    }()
    
    static func create(with viewModel: HomeViewModel) -> HomeThemesViewController {
        let vc = HomeThemesViewController()
        vc.viewModel = viewModel
        
        return vc
    }
    
    override func makeUI() {
        view.addSubview(collectionViewContainer)
        collectionViewContainer.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    override func bindViewModel() {
        
    }
}
