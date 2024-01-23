//
//  HomeThemesCollectionViewController.swift
//  Nagaza
//
//  Created by 전성훈 on 2023/12/01.
//

import UIKit

import RxCocoa
import RxSwift

final class HomeThemesCollectionViewController: NagazaBaseCollectionViewController {
    private var viewModel: HomeViewModel!
    
    static func create(with viewModel: HomeViewModel) -> HomeThemesCollectionViewController {
        let layout = UICollectionViewCompositionalLayout.listLayout(withEstimatedHeight: 215)
        
        let vc = HomeThemesCollectionViewController(collectionViewLayout: layout)
        vc.viewModel = viewModel
        vc.configure()
        
        return vc
    }
    
    private func configure() {
        collectionView.isScrollEnabled = false
    }
    
    override func bindViewModel() {
        
    }
}
