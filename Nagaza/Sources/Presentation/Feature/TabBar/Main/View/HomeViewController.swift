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
    private var comicThemesController: HomeThemesViewController?
    private var dramaThemesController: HomeThemesViewController?
    private var sfThemesController: HomeThemesViewController?
    private var rRatedThemesController: HomeThemesViewController?
    
    private lazy var recommendedContainer: UIView = {
        let view = UIView()
        
        recommendedThemeViewController = RecommendThemeViewController.create(with: viewModel)
        
        if let recommended = recommendedThemeViewController {
            add(child: recommended, container: view)
            view.addSubview(recommended.view)
        }
        
        return view
    }()
    
    private lazy var horrorContainer: UIView = {
        let view = UIView()
        
        horrorThemesViewController = HomeThemesViewController.create(with: viewModel)
        
        if let horror = horrorThemesViewController {
            add(child: horror, container: view)
            view.addSubview(horror.view)
        }
        
        return view
    }()
    
    private lazy var fantasyContainer: UIView = {
        let view = UIView()
        
        fantasyThemesViewController = HomeThemesViewController.create(with: viewModel)
        
        if let fantasy = fantasyThemesViewController {
            add(child: fantasy, container: view)
            view.addSubview(fantasy.view)
        }
        
        return view
    }()
    
    private lazy var suspenseContainer: UIView = {
        let view = UIView()
        
        suspenseThemesViewController = HomeThemesViewController.create(with: viewModel)
        
        if let suspense = suspenseThemesViewController {
            add(child: suspense, container: view)
            view.addSubview(suspense.view)
        }
        
        return view
    }()
    
    private lazy var comicContainer: UIView = {
        let view = UIView()
        
        comicThemesController = HomeThemesViewController.create(with: viewModel)
        
        if let comic = comicThemesController {
            add(child: comic, container: view)
            view.addSubview(comic.view)
        }
        
        return view
    }()
    
    private lazy var dramaContainer: UIView = {
        let view = UIView()
        
        dramaThemesController = HomeThemesViewController.create(with: viewModel)
        
        if let drama = dramaThemesController {
            add(child: drama, container: view)
            view.addSubview(drama.view)
        }
        
        return view
    }()
    
    private lazy var sfContainer: UIView = {
        let view = UIView()
        
        sfThemesController = HomeThemesViewController.create(with: viewModel)
        
        if let sf = sfThemesController {
            add(child: sf, container: view)
            view.addSubview(sf.view)
        }
        
        return view
    }()
    
    private lazy var rRatedContainer: UIView = {
        let view = UIView()
        
        rRatedThemesController = HomeThemesViewController.create(with: viewModel)
        
        if let rRated = rRatedThemesController {
            add(child: rRated, container: view)
            view.addSubview(rRated.view)
        }
        
        return view
    }()
    
    static func create(with viewModel: HomeViewModel) -> HomeViewController {
        let vc = HomeViewController()
        vc.viewModel = viewModel
        
        return vc
    }
    
    override func makeUI() {
   
    }
    
    // MARK: Output
    override func bindViewModel() {
        
    }
}

#if DEBUG

import SwiftUI

struct MainViewControllerPreview: PreviewProvider {
    static var previews: some View {
        let viewController = HomeViewController()
        return viewController.toPreView()
    }
}
#endif
