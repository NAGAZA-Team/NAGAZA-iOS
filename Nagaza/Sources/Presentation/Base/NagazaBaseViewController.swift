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
        navigationController?.navigationBar.backIndicatorImage = NagazaAsset.Images.icArrowRightGray.image
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = NagazaAsset.Images.icArrowRightGray.image
        navigationController?.navigationBar.tintColor = .white
        
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.titleTextAttributes = [.font: UIFont.ngaH3M, .foregroundColor: NagazaAsset.Colors.black.color]
        navBarAppearance.shadowColor = nil
        navigationItem.standardAppearance = navBarAppearance
        navigationItem.scrollEdgeAppearance = navBarAppearance
    }
    
    /// Set up constraints of view and add subviews
    func makeUI() { }
    
    /// Adjust layout after rendering
    func adjustLayoutAfterRendering() { }
    
    /// Data binding between view and model
    func bindViewModel() { }
}
