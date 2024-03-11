//
//  MyPageViewController.swift
//  Nagaza
//
//  Created by SeungMin on 2023/10/18.
//

import UIKit

enum MyPageSectionType: Int {
    case myData
    case appSetting
    case inquiry
}

final class MyPageViewController: NagazaBaseViewController {
    
    private var viewModel: MyPageViewModel!
    
    private var dataSource: DataSource!
    
    static func create(with viewModel: MyPageViewModel) -> MyPageViewController {
        let vc = MyPageViewController()
        vc.viewModel = viewModel
        
        return vc
    }
    
    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.image = NagazaAsset.Images.dummy.image
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 33
        
        return imageView
    }()
    
    private let nicknameLabel: UILabel = {
        let label = UILabel()
        
        label.text = "아기고양이별이님"
        label.font = NagazaFontFamily.Pretendard.semiBold.font(size: 20)
        label.textColor = NagazaAsset.Colors.mainOrange.color
        
        return label
    }()
    
    private let contentsLabel: UILabel = {
        let label = UILabel()
        
        label.text = "오늘 방탈출 하셨나요 하셨나요?"
        label.font = NagazaFontFamily.Pretendard.medium.font(size: 17)
        label.textColor = NagazaAsset.Colors.black1.color
        
        return label
    }()
    
    private let myInfoButton: UIButton = {
        let button = UIButton(type: .custom)
        
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 13
        button.layer.borderColor = NagazaAsset.Colors.gray5.color.cgColor
        
        var config = UIButton.Configuration.plain()
        config.contentInsets = NSDirectionalEdgeInsets(top: 6, leading: 12, bottom: 6, trailing: 12)
        config.attributedTitle = AttributedString("내 정보 보기", attributes: AttributeContainer([NSAttributedString.Key.font: UIFont.ngaP2Sb,
             NSAttributedString.Key.foregroundColor: NagazaAsset.Colors.gray5.color
            ])
        )
        button.configuration = config
        
        return button
    }()
    
    private let gradeView: UIView = {
        let view = UIView()
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 10
        view.layer.borderColor = NagazaAsset.Colors.gray5.color.cgColor
        
        return view
    }()
    
    private let gradeImageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.image = NagazaAsset.Images.icLv5.image
        
        return imageView
    }()
    
    private let gradeInfoLabel: UILabel = {
        let label = UILabel()
        
        label.text = "3번만 더 탈출하면 다음 등급으로 승급할 수 있어요!"
        label.font = NagazaFontFamily.Pretendard.medium.font(size: 12)
        label.textColor = NagazaAsset.Colors.gray5.color
        
        return label
    }()
    
    private let gradeInfoImageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.image = NagazaAsset.Images.icInfo.image
        
        return imageView
    }()
    
    private let settingTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.backgroundColor = NagazaAsset.Colors.white.color
        tableView.register(MyPageTableViewHeader.self, forHeaderFooterViewReuseIdentifier: MyPageTableViewHeader.identifier)
        tableView.register(MyPageTableViewCell.self,
                           forCellReuseIdentifier: MyPageTableViewCell.identifier)
        tableView.separatorInset = .zero
        tableView.sectionHeaderTopPadding = 0
        tableView.sectionFooterHeight = 0
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        settingTableView.delegate = self
    }
    
    override func makeUI() {
        
        view.addSubviews([profileImageView,
                          nicknameLabel,
                          contentsLabel,
                          myInfoButton,
                          gradeView,
                          settingTableView
                         ])
        
        gradeView.addSubviews([gradeImageView,
                               gradeInfoLabel,
                               gradeInfoImageView
                              ])
        
        profileImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(40)
            make.leading.equalToSuperview().inset(30)
            make.size.equalTo(66)
        }
        
        nicknameLabel.snp.makeConstraints { make in
            make.top.equalTo(profileImageView).offset(10)
            make.leading.equalTo(profileImageView.snp.trailing).offset(20)
            make.trailing.equalTo(myInfoButton.snp.leading).offset(-10)
        }
        
        myInfoButton.snp.makeConstraints { make in
            make.top.bottom.equalTo(nicknameLabel)
            make.trailing.equalToSuperview().inset(20)
        }
        
        contentsLabel.snp.makeConstraints { make in
            make.top.equalTo(myInfoButton.snp.bottom).offset(5)
            make.leading.equalTo(nicknameLabel)
            make.trailing.equalToSuperview().inset(20)
        }
        
        gradeView.snp.makeConstraints { make in
            make.top.equalTo(contentsLabel.snp.bottom).offset(13)
            make.directionalHorizontalEdges.equalToSuperview().inset(25)
            make.height.equalTo(56)
        }
        
        gradeImageView.snp.makeConstraints { make in
            make.size.equalTo(40)
            make.leading.equalToSuperview().inset(15)
            make.trailing.equalTo(gradeInfoLabel.snp.leading).offset(-10)
            make.centerY.equalToSuperview()
            make.top.equalToSuperview().inset(10)
        }
        
        gradeInfoLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalTo(gradeInfoImageView.snp.leading).offset(-10)
        }
        
        gradeInfoImageView.snp.makeConstraints { make in
            make.size.equalTo(14)
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(15)
        }
        
        settingTableView.snp.makeConstraints { make in
            make.top.equalTo(gradeView.snp.bottom).offset(30)
            make.directionalHorizontalEdges.bottom.equalToSuperview()
        }
    }
    
    override func bindViewModel() {
        setDataSource()
        
        let initialTrigger = rx.viewWillAppear.map { _ in }.asDriverOnErrorJustEmpty()
        
        let input = MyPageViewModel.Input(initialTrigger: initialTrigger)
        
        let output = viewModel.transform(input: input)
        
        output.sectionItems
            .drive(with: self) { this, list in
                var snapshot = Snapshot()
                snapshot.appendSections([.myData, .appSetting, .inquiry])
                
                list.forEach { item in
                    switch item {
                    case .myData:
                        snapshot.appendItems(item.list, toSection: .myData)
                    case .appSetting:
                        snapshot.appendItems(item.list, toSection: .appSetting)
                    case .inquiry:
                        snapshot.appendItems(item.list, toSection: .inquiry)
                    }
                }
                
                this.dataSource.apply(snapshot)
            }
            .disposed(by: disposeBag)
    }
    
    private func setDataSource() {
        dataSource = DataSource(tableView: settingTableView, cellProvider: { tableView, indexPath, item in
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier:  MyPageTableViewCell.identifier,
                for: indexPath) as? MyPageTableViewCell
            else { return UITableViewCell() }
            cell.selectionStyle = .none
            cell.config(item: item)
            return cell
        })
    }
}

extension MyPageViewController {
    typealias CellType = MyPageTableViewCell
    typealias ModelType = MyPageInfo
    typealias SectionType = MyPageSectionType
    typealias DataSource = UITableViewDiffableDataSource<SectionType, ModelType>
    typealias Snapshot = NSDiffableDataSourceSnapshot<SectionType, ModelType>
}

extension MyPageViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: MyPageTableViewHeader.identifier)
        
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
}

//
//#if DEBUG
//import SwiftUI
//
//struct MyPageViewControllerPreview: PreviewProvider {
//    static var previews: some View {
//        let viewController = MyPageViewController()
//        return viewController.toPreView()
//    }
//}
//#endif
