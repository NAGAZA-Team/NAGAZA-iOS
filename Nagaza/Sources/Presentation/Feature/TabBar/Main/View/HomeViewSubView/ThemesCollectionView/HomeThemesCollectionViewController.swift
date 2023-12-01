//
//  HomeThemesCollectionViewController.swift
//  Nagaza
//
//  Created by 전성훈 on 2023/12/01.
//

import UIKit

final class HomeThemesCollectionViewController: NagazaBaseCollectionViewController {
    private var viewModel: HomeViewModel!
    
    static func create(with viewModel: HomeViewModel) -> HomeThemesCollectionViewController {
        let layout = UICollectionViewLayout()
        
        let vc = HomeThemesCollectionViewController(collectionViewLayout: layout)
        vc.viewModel = viewModel
        
        return vc
    }
    
    override func makeUI() {
        
    }
    
    override func adjustLayoutAfterRendering() {
        
    }
    
    override func bindViewModel() {
        
    }
}
