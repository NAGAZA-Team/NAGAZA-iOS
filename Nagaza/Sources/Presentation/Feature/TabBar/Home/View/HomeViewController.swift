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

final class HomeViewController: NagazaBaseViewController {
    private let themesViewEstimatedHeight: CGFloat = 260
    private let themesViewGroupCount = 7
    
    private var viewModel: HomeViewModel!
    
    private var dataSource: DataSource!
    
    private let mapButtonTapped = PublishSubject<String>()
    
    private lazy var recommendedThemeView = RecommendThemeView()
    
    private lazy var themesCollectionView: UICollectionView = {
        let layout =  UICollectionViewCompositionalLayout.listLayout(withEstimatedHeight: 215)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isScrollEnabled = false
        
        return collectionView
    }()
    
    private lazy var scrollView = UIScrollView()
    
    static func create(with viewModel: HomeViewModel) -> HomeViewController {
        let vc = HomeViewController()
        vc.viewModel = viewModel
        
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setDataSource()
    }
    
    override func navigationSetting() {
        super.navigationSetting()
        
        let mapButtonItem = UIBarButtonItem(image: NagazaAsset.Images.icMapGray.image)
        
        let searchButtonItem = UIBarButtonItem(
            image: NagazaAsset.Images.icSearchGray.image,
            style: .plain,
            target: nil,
            action: nil
        )
        
        navigationItem.title = "전국 전체"
        navigationItem.leftBarButtonItem = mapButtonItem
        navigationItem.rightBarButtonItem = searchButtonItem
        
        mapButtonItem.rx.tap
               .map { [weak self] in
                   self?.navigationItem.title ?? ""
               }
               .bind(to: mapButtonTapped)
               .disposed(by: disposeBag)
    }
    
//    // TODO: DIContainer / FlowCoordinator 연결 예정
//    @objc private func test(_ sender: UIButton) {
//        let action = RegionSettingViewModelActions()
//        let useCase = RegionSettingUseCase()
//        let viewModel = RegionSettingViewModel(regionSettingUseCase: useCase, actions: action)
//        
//        let VC = RegionSettingViewController.create(with: viewModel)
//        
//        self.present(VC, animated: true)
//    }
    
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
        let initialTrigger = rx.viewWillAppear.map { _ in }.asDriverOnErrorJustEmpty()
        
        let contentOffset = scrollView.rx.contentOffset.asDriver()
        
        let mapButtonTapped = mapButtonTapped.asDriverOnErrorJustEmpty()
        
        let input = HomeViewModel.Input(
            initialTrigger: initialTrigger,
            contentOffset: contentOffset,
            mapButtonTapped: mapButtonTapped
        )
        
        let output = viewModel.transform(input: input)
        
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
        
        output.mapButtonTapped
            .drive()
            .disposed(by: disposeBag)
        
        output.selectedRegion
            .drive(self.rx.navigationTitleSetValue)
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
