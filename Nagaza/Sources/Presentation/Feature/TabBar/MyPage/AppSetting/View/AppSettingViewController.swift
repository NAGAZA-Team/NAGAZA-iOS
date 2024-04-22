//
//  MyPageAppSettingViewController.swift
//  Nagaza
//
//  Created by 강조은 on 3/17/24.
//

import UIKit

final class AppSettingViewController: NagazaViewController {
    
    private var viewModel: AppSettingViewModel!
    
    init(viewModel: AppSettingViewModel) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setCoordinatorActions(with actions: CoordinatorActions) {
        viewModel.setCoordinatorActions(with: actions)
    }
    
//    static func create(with viewModel: MyPageAppSettingViewModel) -> MyPageAppSettingViewController {
//        let vc = MyPageAppSettingViewController()
//        vc.viewModel = viewModel
//        
//        return vc
//    }
//    
    private let backButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("뒤로가기", for: .normal)
        button.backgroundColor = .black
        return button
    }()
    
    override func makeUI() {
        super.makeUI()
        view.backgroundColor = .yellow
        
        view.addSubview(backButton)
        
        backButton.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
    
    override func bindViewModel() {
        let backButtonEvent = backButton.rx.tap.asDriver()
        
        let input = AppSettingViewModel.Input(tapBackButton: backButtonEvent)
        let output = viewModel.transform(input: input)
    }
}
