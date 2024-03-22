//
//  MyPageViewController.swift
//  Nagaza
//
//  Created by SeungMin on 2023/10/18.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources

final class MyPageViewController: NagazaBaseViewController {
    
    private var viewModel: MyPageViewModel!
    
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
        config.contentInsets = NSDirectionalEdgeInsets(top: 6,
                                                       leading: 12,
                                                       bottom: 6,
                                                       trailing: 12)
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
        let tableView = UITableView()
        tableView.register(MyPageTableViewHeader.self,
                           forHeaderFooterViewReuseIdentifier: MyPageTableViewHeader.identifier)
        tableView.register(MyPageTableViewCell.self,
                           forCellReuseIdentifier: MyPageTableViewCell.identifier)
        tableView.backgroundColor = NagazaAsset.Colors.white.color
        tableView.separatorInset = .zero
        tableView.sectionHeaderTopPadding = 0
        tableView.sectionFooterHeight = 0
        tableView.isScrollEnabled = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        settingTableView.rx.setDelegate(self)
            .disposed(by: disposeBag)
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
            make.top.equalTo(profileImageView.snp.bottom).offset(24)
            make.directionalHorizontalEdges.equalToSuperview().inset(25)
            make.height.equalTo(56)
        }
        
        gradeImageView.snp.makeConstraints { make in
            make.width.equalTo(40)
            make.leading.equalToSuperview().inset(10)
            make.centerY.equalToSuperview()
        }
        
        gradeInfoLabel.snp.makeConstraints { make in
            make.leading.equalTo(gradeImageView.snp.trailing).offset(10)
            make.trailing.equalTo(gradeInfoImageView.snp.leading).offset(-10)
            make.centerY.equalToSuperview()
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
        let initialTrigger = rx.viewWillAppear.map { _ in }.asDriverOnErrorJustEmpty()
        let appSettingTap = settingTableView.rx.modelSelected(MyPageInfo.self)
        
        let input = MyPageViewModel.Input(initialTrigger: initialTrigger,
                                          appSettingTap: appSettingTap)
        
        let output = viewModel.transform(input: input)
        
        output.sectionItems.asObservable()
            .bind(to: settingTableView.rx.items(dataSource: createDataSource()))
            .disposed(by: disposeBag)
    }
    
    private func createDataSource() -> DataSource {
        return DataSource(
            configureCell: { (_, tableView, indexPath, item) in
                guard let cell = tableView.dequeueReusableCell(
                    withIdentifier:  CellType.identifier,
                    for: indexPath) as? CellType
                else { return UITableViewCell() }
                cell.config(item: item)
                return cell
            }
        )
    }
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

extension MyPageViewController {
    typealias CellType = MyPageTableViewCell
    typealias DataSource = RxTableViewSectionedReloadDataSource<MyPageSection>
}
