//
//  MainViewController.swift
//  Nagaza
//
//  Created by SeungMin on 2023/10/18.
//

import UIKit

import RxSwift
import SnapKit

final class HomeViewController: NagazaBaseViewController {
    
    private var viewModel: HomeViewModel!
    
    private var recommendedThemeViewController: RecommendThemeViewController?
    private var horrorThemesViewController: HomeThemesViewController?
    private var fantasyThemesViewController: HomeThemesViewController?
    private var suspenseThemesViewController: HomeThemesViewController?
    private var comicThemesViewController: HomeThemesViewController?
    private var dramaThemesViewController: HomeThemesViewController?
    private var sfThemesViewController: HomeThemesViewController?
    private var rRatedThemesViewController: HomeThemesViewController?
    
    private lazy var scrollView = UIScrollView()
    
    private lazy var recommendedContainer: UIView = {
        let view = UIView()
        
        recommendedThemeViewController = RecommendThemeViewController.create(with: viewModel)
        view.backgroundColor = .clear
        if let recommended = recommendedThemeViewController {
            add(child: recommended, container: view)
        }
        
        return view
    }()
    
    private lazy var horrorContainer: UIView = {
        let view = UIView()
        
        horrorThemesViewController = HomeThemesViewController.create(with: viewModel)
        
        if let horror = horrorThemesViewController {
            add(child: horror, container: view)
            horror.view.backgroundColor = .white
        }
        
        return view
    }()
    
    private lazy var fantasyContainer: UIView = {
        let view = UIView()
        
        fantasyThemesViewController = HomeThemesViewController.create(with: viewModel)
        
        if let fantasy = fantasyThemesViewController {
            add(child: fantasy, container: view)
            fantasy.view.backgroundColor = .white
        }
        
        return view
    }()
    
    private lazy var suspenseContainer: UIView = {
        let view = UIView()
        
        suspenseThemesViewController = HomeThemesViewController.create(with: viewModel)
        
        if let suspense = suspenseThemesViewController {
            add(child: suspense, container: view)
            suspense.view.backgroundColor = .white
        }
        
        return view
    }()
    
    private lazy var comicContainer: UIView = {
        let view = UIView()
        
        comicThemesViewController = HomeThemesViewController.create(with: viewModel)
        
        if let comic = comicThemesViewController {
            add(child: comic, container: view)
            comic.view.backgroundColor = .white
        }
        
        return view
    }()
    
    private lazy var dramaContainer: UIView = {
        let view = UIView()
        
        dramaThemesViewController = HomeThemesViewController.create(with: viewModel)
        
        if let drama = dramaThemesViewController {
            add(child: drama, container: view)
            drama.view.backgroundColor = .white
        }
        
        return view
    }()
    
    private lazy var sfContainer: UIView = {
        let view = UIView()
        
        sfThemesViewController = HomeThemesViewController.create(with: viewModel)
        
        if let sf = sfThemesViewController {
            add(child: sf, container: view)
            sf.view.backgroundColor = .white
        }
        
        return view
    }()
    
    private lazy var rRatedContainer: UIView = {
        let view = UIView()
        
        rRatedThemesViewController = HomeThemesViewController.create(with: viewModel)
        
        if let rRated = rRatedThemesViewController {
            add(child: rRated, container: view)
            rRated.view.backgroundColor = .white
        }
        
        return view
    }()
    
    static func create(with viewModel: HomeViewModel) -> HomeViewController {
        let vc = HomeViewController()
        vc.viewModel = viewModel
        
        return vc
    }
    
    override func navigationSetting() {
        super.navigationSetting()
        
        let mapButtonItem = UIBarButtonItem(
            image: NagazaAsset.Images.map.image,
            style: .plain,
            target: nil,
            action: nil
        )
        let searchButtonItem = UIBarButtonItem(
            image: NagazaAsset.Images.search.image,
            style: .plain,
            target: nil,
            action: nil
        )
        
        navigationItem.title = "홈"
        navigationItem.leftBarButtonItem = mapButtonItem
        navigationItem.rightBarButtonItem = searchButtonItem
    }
    
    override func makeUI() {
        view.backgroundColor = .black
        
        view.addSubview(scrollView)
        
        scrollView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(view.snp.top)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
        
        scrollView.addSubviews([
            recommendedContainer,
            horrorContainer,
            fantasyContainer,
            suspenseContainer,
            comicContainer,
            dramaContainer,
            sfContainer,
            rRatedContainer
        ])
        
        recommendedContainer.snp.makeConstraints {
            $0.top.equalTo(scrollView.contentLayoutGuide.snp.top).offset(-getNavigationBarPlusSafeAreaInset())
            $0.width.equalTo(scrollView.frameLayoutGuide.snp.width)
            $0.height.equalTo(510 + getNavigationBarPlusSafeAreaInset())
        }
        
        horrorContainer.snp.makeConstraints {
            $0.top.equalTo(recommendedContainer.snp.bottom)
            $0.width.equalTo(scrollView.frameLayoutGuide.snp.width).inset(12)
            $0.leading.equalTo(scrollView.snp.leading).inset(24)
            $0.height.equalTo(255)
            
        }
        
        fantasyContainer.snp.makeConstraints {
            $0.top.equalTo(horrorContainer.snp.bottom)
            $0.width.equalTo(scrollView.frameLayoutGuide.snp.width).inset(12)
            $0.leading.equalTo(scrollView.snp.leading).inset(24)
            $0.height.equalTo(255)
            
        }
        
        suspenseContainer.snp.makeConstraints {
            $0.top.equalTo(fantasyContainer.snp.bottom)
            $0.width.equalTo(scrollView.frameLayoutGuide.snp.width).inset(12)
            $0.leading.equalTo(scrollView.snp.leading).inset(24)
            $0.height.equalTo(255)
        }
        
        comicContainer.snp.makeConstraints {
            $0.top.equalTo(suspenseContainer.snp.bottom)
            $0.width.equalTo(scrollView.frameLayoutGuide.snp.width).inset(12)
            $0.leading.equalTo(scrollView.snp.leading).inset(24)
            $0.height.equalTo(255)
        }
        
        dramaContainer.snp.makeConstraints {
            $0.top.equalTo(comicContainer.snp.bottom)
            $0.width.equalTo(scrollView.frameLayoutGuide.snp.width).inset(12)
            $0.leading.equalTo(scrollView.snp.leading).inset(24)
            $0.height.equalTo(255)
        }
        
        sfContainer.snp.makeConstraints {
            $0.top.equalTo(dramaContainer.snp.bottom)
            $0.width.equalTo(scrollView.frameLayoutGuide.snp.width).inset(12)
            $0.leading.equalTo(scrollView.snp.leading).inset(24)
            $0.height.equalTo(255)
        }
        
        rRatedContainer.snp.makeConstraints {
            $0.top.equalTo(sfContainer.snp.bottom)
            $0.width.equalTo(scrollView.frameLayoutGuide.snp.width).inset(12)
            $0.bottom.equalTo(scrollView.contentLayoutGuide.snp.bottom)
            $0.leading.equalTo(scrollView.snp.leading).inset(24)
            $0.height.equalTo(255)
        }
    }
    
    // MARK: Binding
    override func bindViewModel() {
        let contentOffset = scrollView.rx.contentOffset.asDriver()
        
        let input = HomeViewModel.Input(contentOffset: contentOffset)
        
        let output = viewModel.transform(input: input)
        
        output.alphaValue
            .drive(self.rx.dynamicAlpha)
            .disposed(by: disposeBag)
    }

    func updateNavigationBarAppearance(with alpha: CGFloat) {
        let navBarAppearance = UINavigationBarAppearance()
        
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.backgroundColor = .white.withAlphaComponent(alpha)
        
        navBarAppearance.shadowColor = nil
        
        let isDarkMode = alpha <= 0.5
        
        let titleColor = isDarkMode ?
            NagazaAsset.Colors.white.color :
            NagazaAsset.Colors.black.color
        let buttonColor = isDarkMode ? 
            NagazaAsset.Colors.white.color :
            NagazaAsset.Colors.selected.color
        
        navBarAppearance.titleTextAttributes = [
            .font: UIFont.ngaH3M,
            .foregroundColor: titleColor
        ]
                
        navigationItem.leftBarButtonItem?.tintColor = buttonColor
        navigationItem.rightBarButtonItem?.tintColor = buttonColor
        
        self.navigationItem.standardAppearance = navBarAppearance
        self.navigationItem.scrollEdgeAppearance = navBarAppearance
        
        scrollView.backgroundColor = isDarkMode ? .black : .white
    }
}

extension Reactive where Base: HomeViewController {
    var dynamicAlpha: Binder<CGFloat> {
        return Binder(self.base) { base, alpha in
            base.updateNavigationBarAppearance(with: alpha)
        }
    }
}
//
//#if DEBUG
//
//import SwiftUI
//
//struct MainViewControllerPreview: PreviewProvider {
//    static var previews: some View {
//        let viewController = HomeViewController()
//        return viewController.toPreView()
//    }
//}
//#endif
