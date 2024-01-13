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
    }
    
    private func setupCollectionView() {
        collectionView.isScrollEnabled = false
    }
    
    override func bindViewModel() {
        
    }
}
