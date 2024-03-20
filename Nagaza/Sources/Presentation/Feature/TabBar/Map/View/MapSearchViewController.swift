//
//  MapSearchViewController.swift
//  Nagaza
//
//  Created by SeungMin on 3/13/24.
//

import UIKit

import RxSwift

final class MapSearchViewController: NagazaBaseViewController {
    private var viewModel: MapSearchViewModel!
    private var dataSource: DataSource!
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewCompositionalLayout.searchLayout(withEstimatedHeight: 45)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionView
    }()
    
    static func create(with viewModel: MapSearchViewModel) -> MapSearchViewController {
        let vc = MapSearchViewController()
        vc.viewModel = viewModel
        
        return vc
    }
    
    override func loadView() {
        super.loadView()
        view = collectionView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDataSource()
    }
    
    override func navigationSetting() {
        navigationController?.navigationBar.isHidden = false
        
        let searchTextField: UISearchTextField = {
            let searchTextField = UISearchTextField()
            searchTextField.leftView = nil
            searchTextField.placeholder = "검색어를 입력하세요"
            searchTextField.backgroundColor = .white
            return searchTextField
        }()
        
        let searchButtonItem = UIBarButtonItem(
            image: NagazaAsset.Images.imgSearch.image, 
            style: .plain,
            target: nil,
            action: nil
        )
        
        navigationItem.titleView = searchTextField
        navigationItem.rightBarButtonItem = searchButtonItem
    }
    
    override func bindViewModel() {
        let initialTrigger = self.rx.viewWillAppear.map { _ in }.asDriverOnErrorJustEmpty()
        
        let input = MapSearchViewModel.Input(initialTrigger: initialTrigger)
        
        let ouput = viewModel.transform(input: input)
        
        ouput.recentKeywordList
            .drive(with: self) { owner, recentKeywordlist in
                var snapshot = Snapshot()
                snapshot.appendSections([.home])
                snapshot.appendItems(recentKeywordlist, toSection: .home)
                owner.dataSource.apply(snapshot)
            }
            .disposed(by: disposeBag)
    }
}

extension MapSearchViewController {
    typealias CellType = SearchCollectionViewCell
    typealias ModelType = RecentKeyword
    typealias SectionType = SearchSection
    typealias DataSource = UICollectionViewDiffableDataSource<SectionType, ModelType>
    typealias Snapshot = NSDiffableDataSourceSnapshot<SectionType, ModelType>
    
    private func setDataSource() {
        let headerRegistration = UICollectionView.SupplementaryRegistration
        <SearchHeaderView>(elementKind: UICollectionView.elementKindSectionHeader) { _,_,_ in }
        
        let searchCellRegistration = UICollectionView.CellRegistration<CellType, ModelType> { cell, indexPath, item in
            cell.bind(item: item)
        }
        
        dataSource = DataSource(collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
          return collectionView.dequeueConfiguredReusableCell(using: searchCellRegistration, for: indexPath, item: itemIdentifier)
        })
        
        dataSource.supplementaryViewProvider = { [weak self] (view, kind, index) in
            guard let self = self else { return .none }
            return self.collectionView.dequeueConfiguredReusableSupplementary(
            using: headerRegistration,
            for: index
          )
        }
    }
}

extension UICollectionViewCompositionalLayout {
    static func searchLayout(withEstimatedHeight estimatedHeight: CGFloat = 45) -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout(section: .searchSection(withEstimatedHeight: estimatedHeight))
    }
}

extension NSCollectionLayoutSection {
    static func searchSection(withEstimatedHeight estimatedHeight: CGFloat = 45) -> NSCollectionLayoutSection {
        
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .estimated(estimatedHeight)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .estimated(estimatedHeight)
        )
        
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item])
        
        let sectionHeaderSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(54))
        
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: sectionHeaderSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top
        )
        
        let section = NSCollectionLayoutSection(group: group)
        section.boundarySupplementaryItems = [sectionHeader]
        
        return section
    }
}
