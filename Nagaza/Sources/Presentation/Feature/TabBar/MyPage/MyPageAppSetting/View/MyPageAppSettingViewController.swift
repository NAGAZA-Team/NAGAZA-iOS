//
//  MyPageAppSettingViewController.swift
//  Nagaza
//
//  Created by 강조은 on 3/17/24.
//

import UIKit

final class MyPageAppSettingViewController: NagazaBaseViewController {
    
    private var viewModel: MyPageAppSettingViewModel!
    
    static func create(with viewModel: MyPageAppSettingViewModel) -> MyPageAppSettingViewController {
        let vc = MyPageAppSettingViewController()
        vc.viewModel = viewModel
        
        return vc
    }
    
    override func makeUI() {
        super.makeUI()
        view.backgroundColor = .yellow
    }
}
