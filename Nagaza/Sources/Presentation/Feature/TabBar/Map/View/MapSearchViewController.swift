//
//  MapSearchViewController.swift
//  Nagaza
//
//  Created by SeungMin on 3/13/24.
//

import UIKit

import RxSwift
import RxCocoa

final class MapSearchViewController: NagazaBaseViewController {
    private var viewModel: MapSearchViewModel!
    private var dataSource: DataSource!
    
    private lazy var tableView: NagazaBaseTableView = {
        let tableView = NagazaBaseTableView(
            frame: .zero,
            style: .plain
        )
        tableView.register(
            SearchTableViewCell.self,
            forCellReuseIdentifier: SearchTableViewCell.identifier
        )
        tableView.rowHeight = 75
        return tableView
    }()
    
    private lazy var searchTextField: UISearchTextField = {
        let searchTextField = UISearchTextField()
        searchTextField.leftView = nil
        searchTextField.placeholder = "검색어를 입력하세요"
        searchTextField.backgroundColor = .white
        return searchTextField
    }()
    
    private lazy var searchButtonImageView: UIImageView = {
        let imageView = UIImageView(image:  NagazaAsset.Images.imgSearch.image)
        return imageView
    }()
    
    static func create(with viewModel: MapSearchViewModel) -> MapSearchViewController {
        let vc = MapSearchViewController()
        vc.viewModel = viewModel
        
        return vc
    }
    
    override func loadView() {
        super.loadView()
        view = tableView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDataSource()
    }
    
    override func navigationSetting() {
        navigationController?.navigationBar.isHidden = false
        
        let searchButtonItem = UIBarButtonItem(customView: searchButtonImageView)
        
        navigationItem.titleView = searchTextField
        navigationItem.rightBarButtonItem = searchButtonItem
    }
    
    override func bindViewModel() {
        let initialTrigger = self.rx.viewWillAppear.map { _ in }.asDriverOnErrorJustEmpty()
        
        let searchText = searchTextField.rx.text
        
        let searchButtonTapTrigger = self.searchButtonImageView.rx.tapGesture()
            .when(.recognized)
            .withLatestFrom(searchText) { return $1 ?? "" }
            .asDriverOnErrorJustEmpty()
                
        let itemSelectedTrigger = tableView.rx.itemSelected
            .asDriver()
            .debug()
        
        let input = MapSearchViewModel.Input(
            initialTrigger: initialTrigger,
            searchButtonTapTrigger: searchButtonTapTrigger, 
            itemSelectedTrigger: itemSelectedTrigger
        )
        
        let output = viewModel.transform(input: input)
        
//        ouput.recentKeywordList
//            .drive(with: self) { owner, recentKeywordlist in
//                var snapshot = Snapshot()
//                snapshot.appendSections([.home])
//                snapshot.appendItems(recentKeywordlist, toSection: .home)
//                owner.dataSource.apply(snapshot)
//            }
//            .disposed(by: disposeBag)
        
        output.keywordList
            .drive(with: self) { owner, keywordList in
                var snapshot = Snapshot()
                snapshot.appendSections([.home])
                snapshot.appendItems(keywordList, toSection: .home)
                owner.dataSource.apply(snapshot)
            }
            .disposed(by: disposeBag)
        
        output.itemSelectedActionTrigger
            .drive()
            .disposed(by: disposeBag)
    }
}

extension MapSearchViewController {
    typealias CellType = SearchTableViewCell
    typealias ModelType = Place
    typealias SectionType = SearchSection
    typealias DataSource = UITableViewDiffableDataSource<SectionType, ModelType>
    typealias Snapshot = NSDiffableDataSourceSnapshot<SectionType, ModelType>
    
    private func setDataSource() {
        dataSource = DataSource(tableView: tableView, cellProvider: { [weak self] tableView, indexPath, item in
            guard let self = self else { return UITableViewCell() }
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SearchTableViewCell.identifier) as? SearchTableViewCell
            else { return UITableViewCell() }
            
            cell.bind(
                item: item,
                keyword: self.searchTextField.text
            )
            
            return cell
        })
    }
}
