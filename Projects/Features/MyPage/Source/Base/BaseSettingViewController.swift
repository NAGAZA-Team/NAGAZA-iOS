//
//  BaseSettingViewController.swift
//  MyPage
//
//  Created by 강조은 on 7/29/24.
//

import UIKit
import DSKit

import RxSwift

class BaseSettingViewController: NagazaViewController {
    var tableViewData = PublishRelay<[String]>()
    
    private let naviView = UIView()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = DSKitFontFamily.Pretendard.medium.font(size: 20)
        label.textColor = DSKitColors.Color.black
        return label
    }()
    
    let backButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(DSKitAsset.Images.icArrowLeftGray.image, for: .normal)
        return button
    }()
    
    private let lineView: UIView = {
        let view = UIView()
        view.backgroundColor = DSKitAsset.Colors.gray7.color
        return view
    }()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = 60
        tableView.register(SettingTableViewCell.self, forCellReuseIdentifier: SettingTableViewCell.identifier)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDelegate()
    }
    
    override func makeUI() {
        super.makeUI()
        
        naviView.addSubviews([
            titleLabel,
            backButton
        ])
        
        view.addSubviews([
            naviView,
            lineView,
            tableView
        ])
        
        setConstraints()
    }
    
    private func setConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        naviView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(70)
        }
        
        backButton.snp.makeConstraints { make in
            make.size.equalTo(24)
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().inset(17)
        }
        
        lineView.snp.makeConstraints { make in
            make.top.equalTo(naviView.snp.bottom)
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(1)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(lineView.snp.bottom)
            make.horizontalEdges.bottom.equalToSuperview()
        }
        
        setTableView()
    }
    
    
    private func setTableView() {
        tableViewData.asObservable()
            .subscribe(on: MainScheduler.instance)
            .bind(to: tableView.rx.items(
                cellIdentifier: SettingTableViewCell.identifier,
                cellType: SettingTableViewCell.self)
            ) { index, data, cell in
                cell.configure(text: data)
            }.disposed(by: disposeBag)
    }
}

extension BaseSettingViewController: UITableViewDelegate {
    private func setupDelegate() {
        tableView.rx.setDelegate(self)
            .disposed(by: disposeBag)
    }
}
