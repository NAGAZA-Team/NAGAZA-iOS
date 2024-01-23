//
//  NagazaBaseCollectionViewController.swift
//  Nagaza
//
//  Created by 전성훈 on 2023/12/01.
//

import UIKit

import RxSwift

class NagazaBaseCollectionViewController: UICollectionViewController{
    var disposeBag = DisposeBag()

    private var afterViewDidLoad = true

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
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
    
    /// Set up constraints of view and add subviews
    func makeUI() { }
        
    /// Adjust layout after rendering
    func adjustLayoutAfterRendering() { }
    
    /// Data binding between view and model
    func bindViewModel() { }
}

