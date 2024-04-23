//
//  NagazaBaseViewController.swift
//  Nagaza
//
//  Created by SeungMin on 2023/11/01.
//

import UIKit

import RxSwift

class NagazaViewController: UIViewController {
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
    
    func setCoordinatorActions(with actions: CoordinatorActions) { }
    
    /// Set up Navigation Bar
    func navigationSetting() {
        navigationController?.navigationBar.tintColor = NagazaAsset.Colors.gray3.color
        
        let backButton = UIBarButtonItem(
            image: UIImage(systemName: "chevron.backward"),
            style: .plain,
            target: nil,
            action: nil
        )
        
        navigationItem.leftBarButtonItem = backButton
        
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.titleTextAttributes = [
            .font: UIFont.ngaH3M,
            .foregroundColor: NagazaAsset.Colors.black.color
        ]
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
