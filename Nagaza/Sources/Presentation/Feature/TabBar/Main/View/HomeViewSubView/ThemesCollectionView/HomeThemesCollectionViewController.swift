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
    
    // TODO: 삭제 예정
    private var items = Observable.just([
        ThemeCollectionItemViewModel(themePosterImagePath: nil,isNew: false, isHeart: false, title: "테스트", branch: "셜록홈즈 | 잠실점", rated: 8.8, category: .init(rated: 8.8)),
        ThemeCollectionItemViewModel(themePosterImagePath: nil,isNew: false, isHeart: false, title: "테스트", branch: "셜록홈즈 | 잠실점", rated: 8.8, category: .init(rated: 8.8)),
        ThemeCollectionItemViewModel(themePosterImagePath: nil,isNew: false, isHeart: false, title: "테스트", branch: "셜록홈즈 | 잠실점", rated: 8.8, category: .init(rated: 8.8)),
        ThemeCollectionItemViewModel(themePosterImagePath: nil,isNew: false, isHeart: false, title: "테스트", branch: "셜록홈즈 | 잠실점", rated: 8.8, category: .init(rated: 8.8)),
        ThemeCollectionItemViewModel(themePosterImagePath: nil,isNew: false, isHeart: false, title: "테스트", branch: "셜록홈즈 | 잠실점", rated: 8.8, category: .init(rated: 8.8)),
        ThemeCollectionItemViewModel(themePosterImagePath: nil,isNew: false, isHeart: false, title: "테스트", branch: "셜록홈즈 | 잠실점", rated: 8.8, category: .init(rated: 8.8)),
        ThemeCollectionItemViewModel(themePosterImagePath: nil,isNew: false, isHeart: false, title: "테스트", branch: "셜록홈즈 | 잠실점", rated: 8.8, category: .init(rated: 8.8)),
        ThemeCollectionItemViewModel(themePosterImagePath: nil,isNew: false, isHeart: false, title: "테스트", branch: "셜록홈즈 | 잠실점", rated: 8.8, category: .init(rated: 8.8))
    ])
    
    static func create(with viewModel: HomeViewModel) -> HomeThemesCollectionViewController {
        let layout = UICollectionViewLayout()
        
        let vc = HomeThemesCollectionViewController(collectionViewLayout: layout)
        vc.viewModel = viewModel
        
        return vc
    }
    
    override func makeUI() {
        setupCollectionView()
        setupCollectionViewLayout()

    }
    
    private func setupCollectionView() {
        collectionView.delegate = nil
        collectionView.dataSource = nil
        collectionView.showsHorizontalScrollIndicator = false
        
        collectionView.register(
            ThemeCell.self,
            forCellWithReuseIdentifier: ThemeCell.identifier
        )
        
        items.bind(to: collectionView.rx.items(cellIdentifier: ThemeCell.identifier, cellType: ThemeCell.self)) { (row, element, cell) in 
            
            cell.fill(with: element)
        }
        .disposed(by: disposeBag)
    }
    
    private func setupCollectionViewLayout() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let spacing: CGFloat = 16
        
        layout.itemSize = CGSize(width: 103, height: 207)
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        
        collectionView.setCollectionViewLayout(layout, animated: false)
    }
    
    override func bindViewModel() {
        
    }
}
