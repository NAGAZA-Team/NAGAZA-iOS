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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationSetting()
        makeUI()
        bindViewModel()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        adjustLayoutAfterRendering()
    }
    
    /// Set up Navigation Bar
    func navigationSetting() {
        navigationController?.navigationBar.topItem?.title = ""
        navigationController?.navigationBar.backIndicatorImage = NagazaAsset.Images.chevron.image
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = NagazaAsset.Images.chevron.image
        navigationController?.navigationBar.tintColor = .white
        
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.titlePositionAdjustment.horizontal = -CGFloat.greatestFiniteMagnitude
//        navBarAppearance.titleTextAttributes = [.font: UIFont.thtH4Sb, .foregroundColor: NagazaAsset.Color.neutral50.color]
//        navBarAppearance.backgroundColor = NagazaAsset.Color.neutral700.color
        navBarAppearance.shadowColor = nil
        navigationItem.standardAppearance = navBarAppearance
        navigationItem.scrollEdgeAppearance = navBarAppearance
    }
    
    /// call in super viewDidLoad
    func makeUI() { }
        
    /// call in super viewDidLayoutSubviews
    func adjustLayoutAfterRendering() { }
    
    /// call in super viewDidLoad
    func bindViewModel() { }
}
