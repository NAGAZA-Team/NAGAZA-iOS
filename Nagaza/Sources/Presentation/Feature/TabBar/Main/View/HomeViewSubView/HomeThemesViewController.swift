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

        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .ngaSubTitle2M
        // TODO: 변경 예정
        label.textColor = .black
        label.text = "테스트입니다."
        
        return label
    }()
    
    private lazy var pushButton: UIButton = {
        let btn = UIButton()
        
        btn.translatesAutoresizingMaskIntoConstraints = false
        // TODO: 변경 예정
        btn.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        
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
    
    override func adjustLayoutAfterRendering() {
        collectionViewContainer.snp.makeConstraints {
            $0.top.equalTo(themeLabel.snp.bottom).offset(13)
            $0.leading.equalTo(view.snp.leading)
            $0.bottom.equalTo(view.snp.bottom)
            $0.trailing.equalTo(view.snp.trailing)
        }
    }
    override func makeUI() {
        view.addSubviews([
            themeLabel,
            pushButton,
            collectionViewContainer
        ])
        
        tBhemeLabel.snp.makeConstraints {
            $0.top.equalTo(view.snp.top).inset(13)
            $0.leading.equalTo(view.snp.leading)
        }
        
        pushButton.snp.makeConstraints {
            $0.centerY.equalTo(themeLabel.snp.centerY)
            $0.trailing.equalTo(view.snp.trailing).inset(16)
        }
    }
    
    override func bindViewModel() {
        
    }
}
