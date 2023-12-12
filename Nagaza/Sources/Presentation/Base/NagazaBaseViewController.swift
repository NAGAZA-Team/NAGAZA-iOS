//
//  NagazaBaseViewController.swift
//  Nagaza
//
//  Created by SeungMin on 2023/11/01.
//

import UIKit

import RxSwift

class NagazaBaseViewController: UIViewController {
    var disposeBag = DisposeBag()
    
    private var afterViewDidLoad = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationSetting()
        makeUI()
        bindViewModel()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        if afterViewDidLoad {
            afterViewDidLoad.toggle()
            adjustLayoutAfterRendering()
        }
    }
    
    /// Set up Navigation Bar
    func navigationSetting() {
        navigationController?.navigationBar.backIndicatorImage = NagazaAsset.Images.chevron.image
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = NagazaAsset.Images.chevron.image
        navigationController?.navigationBar.tintColor = .white
        
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.titleTextAttributes = [.font: UIFont.ngaH3M, .foregroundColor: NagazaAsset.Colors.black.color]
        navBarAppearance.shadowColor = nil
        navigationItem.standardAppearance = navBarAppearance
        navigationItem.scrollEdgeAppearance = navBarAppearance
    }
    
    func getNavigationBarPlusSafeAreaInset() -> CGFloat {
        let navigationBarHeight = navigationController?.navigationBar.frame.height ?? 0
        let statusBarHeight = UIApplication.shared.statusBarFrame.height
        let topInset = view.safeAreaInsets.top
        let totalHeight = statusBarHeight + navigationBarHeight + topInset
        return totalHeight
    }
    
    /// call in super viewDidLoad
    func makeUI() { }
    
    /// call in super viewDidLayoutSubviews
    func adjustLayoutAfterRendering() { }
    
    /// call in super viewDidLoad
    func bindViewModel() { }
}
