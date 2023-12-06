//
//  NagazaBaseTableViewController.swift
//  Nagaza
//
//  Created by 전성훈 on 2023/12/05.
//

import UIKit

import RxSwift

class NagazaBaseTableViewController: UICollectionViewController{
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
    
    /// call in super viewDidLoad
    func makeUI() { }
        
    /// call in super viewDidLayoutSubviews
    func adjustLayoutAfterRendering() { }
    
    /// call in super viewDidLoad
    func bindViewModel() { }
}

