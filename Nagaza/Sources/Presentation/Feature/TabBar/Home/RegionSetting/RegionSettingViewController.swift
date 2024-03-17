//
//  RegionSettingViewController.swift
//  Nagaza
//
//  Created by 전성훈 on 2024/02/19.
//

import UIKit

import RxSwift
import RxCocoa
import RxDataSources
import SnapKit

final class RegionSettingViewController: NagazaBaseViewController {
    private var viewModel: RegionSettingViewModel!

    private lazy var mainRegionTableView: UITableView = {
        let tableView = UITableView()
        tableView.bounces = false
        tableView.separatorStyle = .none
        tableView.backgroundColor = NagazaAsset.Colors.gray8.color
        
        tableView.register(
            MainRegionTableViewCell.self,
            forCellReuseIdentifier: MainRegionTableViewCell.identifier
        )
        
        return tableView
    }()
    
    private lazy var subReginTableView: UITableView = {
        let tableView = UITableView()
        tableView.bounces = false
        tableView.backgroundColor = NagazaAsset.Colors.white.color
        
        tableView.register(
            SubRegionTableViewCell.self,
            forCellReuseIdentifier: SubRegionTableViewCell.identifier
        )
        
        return tableView
    }()
    
    static func create(with viewModel: RegionSettingViewModel) -> RegionSettingViewController {
        let vc = RegionSettingViewController()
        
        vc.viewModel = viewModel
        
        return vc
    }
    
    override func navigationSetting() {
        navigationItem.title = "지역 선택"
    }
    

    override func makeUI() {
        [
            mainRegionTableView,
            subReginTableView
        ].forEach {
            self.view.addSubview($0)
        }
        
        mainRegionTableView.rowHeight = 50
        subReginTableView.rowHeight = 50
        
        mainRegionTableView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.width.equalTo(130)
            $0.bottom.equalToSuperview()
        }
        
        subReginTableView.snp.makeConstraints {
            $0.top.equalTo(mainRegionTableView.snp.top)
            $0.leading.equalTo(mainRegionTableView.snp.trailing)
            $0.trailing.equalToSuperview()
            $0.bottom.equalTo(mainRegionTableView.snp.bottom)
        }
    }
    
    override func bindViewModel() {
        let viewWillAppearTrigger = self.rx.viewWillAppear
            .map { _ in }
            .asDriverOnErrorJustEmpty()
        
        let mainRegionSelected = mainRegionTableView.rx.itemSelected
             .map {
                return $0.row
             }
             .asDriver(onErrorJustReturn: 0)
        
        let subRegionSelectied = subReginTableView.rx.modelSelected(String.self)
            .asDriver()
        
        let input = RegionSettingViewModel.Input(
            viewWillAppearTrigger: viewWillAppearTrigger,
            mainRegionSelected: mainRegionSelected,
            subRegionSelected: subRegionSelectied
        )
        
        let output = viewModel.transform(input: input)
        
        output.viewWillAppearTrigger
            .drive()
            .disposed(by: disposeBag)
        
        output.mainRegins
            .drive(mainRegionTableView.rx.items(
                cellIdentifier: MainRegionTableViewCell.identifier,
                cellType: MainRegionTableViewCell.self)
            ) { index, region, cell in
                cell.bind(region: region)
                cell.selectionStyle = .none
            }
            .disposed(by: disposeBag)
        
        output.subRegions
            .drive(subReginTableView.rx.items(
                cellIdentifier: SubRegionTableViewCell.identifier,
                cellType: SubRegionTableViewCell.self)
            ) { index, region, cell in
                cell.bind(region: region)
                cell.selectionStyle = .none
            }
            .disposed(by: disposeBag)
        
        output.mainRegionSelected
            .drive()
            .disposed(by: disposeBag)
        
        output.subRegionsUpdated
            .drive()
            .disposed(by: disposeBag)
    }
}

extension Reactive where Base: RegionSettingViewController {
    
}

//
//#if DEBUG
//
//import SwiftUI
//
//struct MainViewControllerPreview: PreviewProvider {
//    static var previews: some View {
//        let action = RegionFilterViewModelActions()
//        let viewModel = RegionFilterViewModel(actions: action)
//        let viewController = RegionFilterViewController.create(with: viewModel)
//        
//        let navigationVC = UINavigationController(rootViewController: viewController)
//        
//        return navigationVC.toPreView()
//    }
//}
//#endif
