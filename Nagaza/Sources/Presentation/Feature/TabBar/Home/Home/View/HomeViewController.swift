//
//  HomeViewController.swift
//  Nagaza
//
//  Created by SeungMin on 2023/10/18.
//

import UIKit

import RxSwift
import SnapKit

final class HomeViewController: NagazaViewController {
    private let themesViewEstimatedHeight: CGFloat = 260
    private let themesViewGroupCount = 7
    
    private var viewModel: HomeViewModel!
    
    private var dataSource: DataSource!
    
    private lazy var mapButtonItem: UIBarButtonItem = {
        let barButtonItem = UIBarButtonItem(image: NagazaAsset.Images.icMapGray.image)
        return barButtonItem
    }()
    
    private lazy var recommendedThemeView = RecommendThemeView()
    
    private lazy var themesCollectionView: UICollectionView = {
        let layout =  UICollectionViewCompositionalLayout.listLayout(withEstimatedHeight: 215)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isScrollEnabled = false
        
        return collectionView
    }()
    
    private lazy var scrollView = UIScrollView()
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setCoordinatorActions(with actions: any CoordinatorActions) {
        viewModel.setCoordinatorActions(with: actions)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setDataSource()
    }
    
    override func navigationSetting() {
        super.navigationSetting()
        
        let searchButtonItem = UIBarButtonItem(
            image: NagazaAsset.Images.icSearchGray.image,
            style: .plain,
            target: nil,
            action: nil
        )
        
        navigationItem.title = "전국 전체"
        navigationItem.leftBarButtonItem = mapButtonItem
        navigationItem.rightBarButtonItem = searchButtonItem
    }
    
    override func makeUI() {
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        scrollView.addSubviews([recommendedThemeView, themesCollectionView])
        recommendedThemeView.snp.makeConstraints {
            $0.top.leading.trailing.width.equalTo(scrollView)
            $0.height.equalTo(CGFloat.windowFrameheight / 2)
        }
        
        themesCollectionView.snp.makeConstraints {
            $0.top.equalTo(recommendedThemeView.snp.bottom)
            $0.leading.trailing.width.bottom.equalTo(scrollView)
            $0.height.equalTo(themesViewEstimatedHeight * CGFloat(themesViewGroupCount))
        }
    }
    
    // MARK: Binding
    override func bindViewModel() {
        let viewWillAppearTrigger = rx.viewWillAppear.map { _ in }.asDriverOnErrorJustEmpty()
        let contentOffset = scrollView.rx.contentOffset.asDriver()
        let didTappedMap = mapButtonItem.rx.tap.asDriver()
        
        let input = HomeViewModel.Input(
            viewWillAppearTrigger: viewWillAppearTrigger,
            contentOffset: contentOffset,
            didTappedMap: didTappedMap
        )
        
        let output = viewModel.transform(input: input)
        
        output.regionTitle
            .drive(self.rx.navigationTitleSetValue)
            .disposed(by: disposeBag)
        
        output.roomsList
            .drive(with: self, onNext: { this, roomslist in
                var snapshot = Snapshot()
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
                }
                this.dataSource.apply(snapshot)
            })
            .disposed(by: disposeBag)
        
        output.scrollOffsetState
            .drive(self.rx.scrollOffsetState)
            .disposed(by: disposeBag)
        
        output.didTappedMap
            .drive()
            .disposed(by: disposeBag)
    }
    
    internal func updateNavigationBarAppearance(with state: ScrollOffsetState) {
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
    
    internal func updateNavigationTitle(with region: String) {
        navigationItem.title = region
    }
}

extension Reactive where Base: HomeViewController {
    var scrollOffsetState: Binder<ScrollOffsetState> {
        return Binder(self.base) { base, state in
            base.updateNavigationBarAppearance(with: state)
        }
    }
    
    var navigationTitleSetValue: Binder<String> {
        return Binder(self.base) { base, region in
            base.updateNavigationTitle(with: region)
        }
    }
}

extension HomeViewController {
    typealias CellType = ThemeCell
    typealias ModelType = Room
    typealias SectionType = HomeSectionType
    typealias DataSource = UICollectionViewDiffableDataSource<SectionType, ModelType>
    typealias Snapshot = NSDiffableDataSourceSnapshot<SectionType, ModelType>
    
    private func setDataSource() {
        let roomCellRegistraition = UICollectionView.CellRegistration<CellType, ModelType> { [weak self] cell, indexPath, item in
            
            cell.bind(with: item)
            // cell.delegate = self
        }
        
        let headerRegistration = UICollectionView.SupplementaryRegistration<SectionHeaderView>(elementKind: UICollectionView.elementKindSectionHeader) { supplementaryView, elementKind, indexPath in
            let sectionType = HomeSectionType(rawValue: indexPath.section) ?? .comic
            supplementaryView.themeLabel.text = sectionType.title
        }
        
        dataSource = DataSource(collectionView: themesCollectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            return collectionView.dequeueConfiguredReusableCell(using: roomCellRegistraition, for: indexPath, item: itemIdentifier)
        })
        
        dataSource.supplementaryViewProvider = { (view, kind, index) in
            return self.themesCollectionView.dequeueConfiguredReusableSupplementary(
                using: headerRegistration,
                for: index
            )
        }
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
