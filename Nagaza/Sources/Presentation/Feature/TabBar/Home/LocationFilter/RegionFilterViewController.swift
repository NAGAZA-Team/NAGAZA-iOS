//
//  RegionFilterViewController.swift
//  Nagaza
//
//  Created by 전성훈 on 2024/02/19.
//

import UIKit

import RxSwift
import SnapKit

final class RegionFilterViewController: NagazaBaseViewController {
    private var viewModel: RegionFilterViewModel!
    
    private lazy var mainRegionTableView: UITableView = {
        let tableView = UITableView()
        tableView.bounces = false
        
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
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
            $0.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview($0)
        }
        
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
        
    }
}

extension Reactive where Base: RegionFilterViewController {
    
}

