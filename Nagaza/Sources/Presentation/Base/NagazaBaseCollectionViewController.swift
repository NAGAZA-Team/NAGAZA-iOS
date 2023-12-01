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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        makeUI()
        bindViewModel()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        adjustLayoutAfterRendering()
    }
    
    /// call in super viewDidLoad
    func makeUI() { }
        
    /// call in super viewDidLayoutSubviews
    func adjustLayoutAfterRendering() { }
    
    /// call in super viewDidLoad
    func bindViewModel() { }
}

