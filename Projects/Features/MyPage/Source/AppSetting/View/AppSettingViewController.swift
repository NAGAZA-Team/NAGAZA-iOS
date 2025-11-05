//
//  MyPageAppSettingViewController.swift
//  Nagaza
//
//  Created by 강조은 on 3/17/24.
//

import UIKit

import Core
import DSKit

final class AppSettingViewController: BaseSettingViewController {
    
    private var viewModel: AppSettingViewModel!
    
    init(viewModel: AppSettingViewModel) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setCoordinatorActions(with actions: CoordinatorActions) {
        viewModel.setCoordinatorActions(with: actions)
    }
    
    override func makeUI() {
        super.makeUI()
    }
    
    override func bindViewModel() {
        let backButtonEvent = backButton.rx.tap.asDriver()
        
        let viewDidLoadTrigger = rx.viewWillAppear.mapToVoid().asDriverOnErrorJustEmpty()
        
        let input = AppSettingViewModel.Input(
            tapBackButton: backButtonEvent,
            viewDidLoadTrigger: viewDidLoadTrigger
        )
        
        let output = viewModel.transform(input: input)
        
        output.tableViewData
            .drive(with: self, onNext: { owner, list in
                owner.tableViewData.accept(list)
            })
            .disposed(by: disposeBag)
    }
    
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        
//        configure(title: "앱 설정", list: ["테스트1","테스트2","테스트3"])
//    }
}
