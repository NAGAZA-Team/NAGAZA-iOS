//
//  HomeViewController.swift
//  Nagaza
//
//  Created by SeungMin on 2023/10/18.
//

import UIKit

import RxSwift
import SnapKit

enum HomeSectionType: Int {
    case horror
    case fantasy
    case suspense
    case comic
    case drama
    case sf
    case rRtated
    
    var title: String {
        switch self {
        case .horror:
            return "공포 순"
        case .fantasy:
            return "판타지 순"
        case .suspense:
            return "스릴러 순"
        case .comic:
            return "코믹 순"
        case .drama:
            return "드라마 순"
        case .sf:
            return "공상과학 순"
        case .rRtated:
            return "별점 순"
        }
    }
}

struct ElementKind {
    static let badge = "badge-element-kind"
    static let background = "background-element-kind"
    static let sectionHeader = "section-header-element-kind"
    static let sectionFooter = "section-footer-element-kind"
    static let layoutHeader = "layout-header-element-kind"
    static let layoutFooter = "layout-footer-element-kind"
}

final class HomeViewController: NagazaBaseViewController {
    private var viewModel: HomeViewModel!
    private var collectionViewEstimatedHeight: CGFloat = 260
    
    private var dataSource: UICollectionViewDiffableDataSource<HomeSectionType, Room>? = nil
    
    private lazy var recommendedThemeViewController: RecommendThemeViewController = {
        let vc = RecommendThemeViewController.create(with: viewModel)
        return vc
    }()
    
    private lazy var themesViewController: HomeThemesViewController = {
        let vc = HomeThemesViewController.create(with: viewModel)
        return vc
    }()
    
    private lazy var scrollView = UIScrollView()
        
    private lazy var recommendedContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        add(child: recommendedThemeViewController, container: view)
        
        return view
    }()
    
    private lazy var themesContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        add(child: themesViewController, container: view)
        
        return view
    }()
    
    static func create(with viewModel: HomeViewModel) -> HomeViewController {
        let vc = HomeViewController()
        vc.viewModel = viewModel
        
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureDataSource()
        self.configureCollectionView()
    }
    
    override func navigationSetting() {
        super.navigationSetting()
        
        let mapButtonItem = UIBarButtonItem(
            image: NagazaAsset.Images.icMapGray.image,
            style: .plain,
            target: nil,
            action: nil
        )
        let searchButtonItem = UIBarButtonItem(
            image: NagazaAsset.Images.icSearchGray.image,
            style: .plain,
            target: nil,
            action: nil
        )
        
        navigationItem.title = "홈"
        navigationItem.leftBarButtonItem = mapButtonItem
        navigationItem.rightBarButtonItem = searchButtonItem
    }
    
    override func makeUI() {
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        scrollView.addSubviews([recommendedContainer, themesContainer])
        recommendedContainer.snp.makeConstraints {
            $0.top.leading.trailing.width.equalTo(scrollView)
            $0.height.equalTo(CGFloat.windowFrameheight / 2)
        }
        
        themesContainer.snp.makeConstraints {
            $0.top.equalTo(recommendedContainer.snp.bottom)
            $0.leading.trailing.width.bottom.equalTo(scrollView)
            $0.height.equalTo(collectionViewEstimatedHeight * 7)
        }
    }
    
    // MARK: Binding
    override func bindViewModel() {
        let initialTrigger = rx.viewWillAppear.map { _ in }.asDriverOnErrorJustEmpty()
        let contentOffset = scrollView.rx.contentOffset.asDriver()
        
        let input = HomeViewModel.Input(
            initialTrigger: initialTrigger,
            contentOffset: contentOffset)
        
        let output = viewModel.transform(input: input)
        
        output.roomsList
            .drive(with: self, onNext: { [weak self] this, roomslist in
                guard let self = self else { return }
                var snapshot = NSDiffableDataSourceSnapshot<HomeSectionType, Room>()
                snapshot.appendSections([.horror, .fantasy, .suspense, .comic, .drama, .sf, .rRtated])
                for (index, list) in roomslist.enumerated() {
                    let homeSectionType = HomeSectionType(rawValue: index) ?? .comic
                    switch homeSectionType {
                    case .horror:
                        snapshot.appendItems(list, toSection: .horror)
                    case .fantasy:
                        snapshot.appendItems(list, toSection: .fantasy)
                    case .suspense:
                        snapshot.appendItems(list, toSection: .suspense)
                    case .comic:
                        snapshot.appendItems(list, toSection: .comic)
                    case .drama:
                        snapshot.appendItems(list, toSection: .drama)
                    case .sf:
                        snapshot.appendItems(list, toSection: .sf)
                    case .rRtated:
                        snapshot.appendItems(list, toSection: .rRtated)
                    }
                    
                    let collectionView = self.themesViewController.themesCollectionViewController.collectionView
                    collectionView?.collectionViewLayout = getLayout(
                        groupCount: roomslist.count,
                        listCount: list.count
                    )
                    this.dataSource?.apply(snapshot)
                }
            })
            .disposed(by: disposeBag)
        
        output.scrollOffsetState
            .drive(self.rx.scrollOffsetState)
            .disposed(by: disposeBag)
    }
    
    func updateNavigationBarAppearance(with state: ScrollOffsetState) {
        let navBarAppearance = UINavigationBarAppearance()
        
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.backgroundColor = .white.withAlphaComponent(state.alpha)
        
        navBarAppearance.shadowColor = nil
        
        let isDarkMode = state.alpha <= 0.3
        
        let titleColor = isDarkMode ?
        NagazaAsset.Colors.white.color :
        NagazaAsset.Colors.black.color
        let buttonColor = isDarkMode ?
        NagazaAsset.Colors.white.color :
        NagazaAsset.Colors.gray3.color
        
        navBarAppearance.titleTextAttributes = [
            .font: UIFont.ngaH3M,
            .foregroundColor: titleColor
        ]
        
        navigationItem.leftBarButtonItem?.tintColor = buttonColor
        navigationItem.rightBarButtonItem?.tintColor = buttonColor
        
        self.navigationItem.standardAppearance = navBarAppearance
        self.navigationItem.scrollEdgeAppearance = navBarAppearance
        
        scrollView.backgroundColor = isDarkMode ? .black : .white
    }
}

extension Reactive where Base: HomeViewController {
    var scrollOffsetState: Binder<ScrollOffsetState> {
        return Binder(self.base) { base, state in
            base.updateNavigationBarAppearance(with: state)
        }
    }
}

extension HomeViewController {
    private func configureDataSource() {
        let roomCellRegistraition = UICollectionView.CellRegistration<ThemeCell, Room> { [weak self] cell, indexPath, item in
            
            cell.bind(with: item)
//            cell.delegate = self
        }
        
        let headerRegistration = UICollectionView.SupplementaryRegistration<SectionHeaderView>(elementKind: ElementKind.sectionHeader) { supplementaryView, elementKind, indexPath in
            let sectionType = HomeSectionType(rawValue: indexPath.section) ?? .comic
            supplementaryView.themeLabel.text = sectionType.title
        }
        
        dataSource = UICollectionViewDiffableDataSource<HomeSectionType, Room>(collectionView: themesViewController.themesCollectionViewController.collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            return collectionView.dequeueConfiguredReusableCell(using: roomCellRegistraition, for: indexPath, item: itemIdentifier)
        })
        
        dataSource?.supplementaryViewProvider = { (view, kind, index) in
            return self.themesViewController.themesCollectionViewController.collectionView.dequeueConfiguredReusableSupplementary(
                using: headerRegistration,
                for: index
            )
        }
    }
    
    private func configureCollectionView() {
        let collectionView = self.themesViewController.themesCollectionViewController.collectionView
        collectionView?.dataSource = dataSource
    }
    
    private func getLayout(groupCount: Int, listCount: Int) -> UICollectionViewCompositionalLayout {
        
        let layout = UICollectionViewCompositionalLayout { [weak self] (sectionIndex: Int,
                                                                        layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            let itemSize = NSCollectionLayoutSize(
                widthDimension: .estimated(1.0),
                heightDimension: .fractionalHeight(1.0)
            )

            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            item.contentInsets = NSDirectionalEdgeInsets(
                top: 0,
                leading: 16,
                bottom: 0,
                trailing: 0
            )
            
            let totalItemWidth = 100 * listCount
            let totelSpacingWidth = 24 * 2 + 16 * listCount - 1
            let collectionViewEstimatedHeight = self?.collectionViewEstimatedHeight ?? 0
            let sectionHeaderHeight: CGFloat = collectionViewEstimatedHeight == 0 ? 0 : 45
            
            let groupSize = NSCollectionLayoutSize(
                widthDimension: .absolute(CGFloat(totalItemWidth + totelSpacingWidth)),
                heightDimension: .absolute(collectionViewEstimatedHeight - sectionHeaderHeight)
            )
            
            let group = NSCollectionLayoutGroup.horizontal(
                layoutSize: groupSize,
                subitem: item,
                count: listCount
            )
            
            let headerFooterSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .estimated(45))
            
            let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
                layoutSize: headerFooterSize,
                elementKind: ElementKind.sectionHeader,
                alignment: .top
            )
            
            let section = NSCollectionLayoutSection(group: group)
            section.contentInsets = NSDirectionalEdgeInsets(
                top: 0,
                leading: 8,
                bottom: 0,
                trailing: 24
            )
            section.boundarySupplementaryItems = [sectionHeader]
            section.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary
            return section
        }
        return layout
    }
}

//
//#if DEBUG
//
//import SwiftUI
//
//struct MainViewControllerPreview: PreviewProvider {
//    static var previews: some View {
//        let viewController = HomeViewController()
//        return viewController.toPreView()
//    }
//}
//#endif
