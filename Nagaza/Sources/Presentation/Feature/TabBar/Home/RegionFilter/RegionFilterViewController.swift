//
//  RegionFilterViewController.swift
//  Nagaza
//
//  Created by 전성훈 on 2024/02/19.
//

import UIKit

import RxSwift
import RxCocoa
import RxDataSources
import SnapKit

final class RegionFilterViewController: NagazaBaseViewController {
    private var viewModel: RegionFilterViewModel!
    
    
    private lazy var mainRegionTableView: UITableView = {
        let tableView = UITableView()
        tableView.bounces = false
        tableView.separatorStyle = .none
        
        tableView.register(
            MainRegionTableViewCell.self,
            forCellReuseIdentifier: MainRegionTableViewCell.identifier
        )
        
        return tableView
    }()
    
    private lazy var subReginTableView: UITableView = {
        let tableView = UITableView()
        tableView.bounces = false

        tableView.register(
            SubRegionTableViewCell.self,
            forCellReuseIdentifier: SubRegionTableViewCell.identifier
        )
        
        return tableView
    }()
    
    static func create(with viewModel: RegionFilterViewModel) -> RegionFilterViewController {
        let vc = RegionFilterViewController()
        vc.viewModel = viewModel
        
        return vc
    }
    
    override func loadView() {
        super.loadView()
        
        setupMainRegionTableViewBinding()
    }
    
    override func navigationSetting() {
        navigationItem.title = "지역 선택"
    }
    
    /// 더미 데이터 생성 후 UI 세부 조정 예정
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
        let mainRegionSelected = mainRegionTableView.rx.itemSelected
             .map { 
                return $0.row
             }
             .asDriver(onErrorJustReturn: 0)
        
        let input = RegionFilterViewModel.Input(
            mainRegionSelection: mainRegionSelected,
            subRegionSelection: subReginTableView.rx.modelSelected(String.self).asDriver()
        )
        
        let output = viewModel.transform(input: input)
        
        output.subRegions
            .drive(subReginTableView.rx.items(
                cellIdentifier: SubRegionTableViewCell.identifier,
                cellType: SubRegionTableViewCell.self)
            ) { index, region, cell in
                cell.bind(region: region, count: "500")
            }
            .disposed(by: disposeBag)
        
        output.reloadMainRegions
            .drive(onNext: { [weak self] _ in
                self?.mainRegionTableView.reloadData()
            })
            .disposed(by: disposeBag)
    }
    
    private func setupMainRegionTableViewBinding() {
        viewModel.loadMainRegions()
            .drive(
                mainRegionTableView.rx.items(
                    cellIdentifier: MainRegionTableViewCell.identifier,
                    cellType: MainRegionTableViewCell.self)
            ) { index, data, cell in

                cell.selectionStyle = .none
                cell.bind(region: data.0.title, isSelected: data.1)
            }
            .disposed(by: disposeBag)
    }
}

extension Reactive where Base: RegionFilterViewController {
    
}


#if DEBUG

import SwiftUI

struct MainViewControllerPreview: PreviewProvider {
    static var previews: some View {
        let action = RegionFilterViewModelActions()
        let viewModel = RegionFilterViewModel(actions: action)
        let viewController = RegionFilterViewController.create(with: viewModel)
        
        let navigationVC = UINavigationController(rootViewController: viewController)
        
        return navigationVC.toPreView()
    }
}
#endif
