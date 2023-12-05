//
//  NagazaTabBarController.swift
//  Nagaza
//
//  Created by 전성훈 on 2023/11/07.
//

import UIKit

import SnapKit

enum TabBarType: CaseIterable {
    case home
    case map
    case review
    case myPage
    
    var title: String {
        switch self {
        case .home: return "홈"
        case .map: return "지도"
        case .review: return "리뷰"
        case .myPage: return "마이페이지"
        }
    }
    
    var icon: UIImage {
        switch self {
        case .home: return NagazaAsset.Images.home.image.withRenderingMode(.alwaysTemplate)
        case .map: return NagazaAsset.Images.pin.image.withRenderingMode(.alwaysTemplate)
        case .review: return NagazaAsset.Images.pen.image.withRenderingMode(.alwaysTemplate)
        case .myPage: return NagazaAsset.Images.setting.image.withRenderingMode(.alwaysTemplate)
        }
    }
}

protocol TabBarDelegate: AnyObject {
    func shouldHideTabBar(_ hide: Bool)
}

final class NagazaTabBarController: NagazaBaseViewController {
    let tabBarHeight: CGFloat = 56
    
    private lazy var viewControllers: [UIViewController] = []
    
    private lazy var buttons: [TabBarButton] = []
    private var types: [TabBarType] = []

    private lazy var tabBarView: UIView = {
        let view = UIView()
        
        view.backgroundColor = .white
        
        return view
    }()
    
    var selectedIndex: Int = 0 {
        willSet {
            previousIndex = selectedIndex
        }
        didSet {
            updateView()
        }
    }
    
    private var previousIndex = 0
    
    override func makeUI() {
        view.addSubview(tabBarView)
    }
    
    override func adjustLayoutAfterRendering() {
        updateTabBarHeight()
        setupButtons(with: types)
    }

    func setViewControllers(_ viewControllers: [UIViewController],
                            with types: [TabBarType]) {
        guard viewControllers.count == types.count else { return }
        
        self.viewControllers = viewControllers
        self.types = types
    }
    
    private func updateTabBarHeight() {
        tabBarView.snp.makeConstraints {
            $0.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(tabBarHeight)
        }
    }
    
    private func setupButtons(with types: [TabBarType]) {
        let buttonWidth = view.bounds.width / CGFloat(types.count)
        
        for (index, type) in types.enumerated() {
            let button = TabBarButton(tabBarType: type)
            button.tag = index
            button.addTarget(self, action: #selector(tabBarButtonTapped(_:)), for: .touchUpInside)
            
            tabBarView.addSubview(button)
            buttons.append(button)
            
            button.snp.makeConstraints {
                $0.leading.equalToSuperview().offset(buttonWidth * CGFloat(index))
                $0.width.equalTo(buttonWidth)
                $0.height.equalTo(tabBarHeight)
            }
        }
    }
    
    private func updateView() {
        deleteView()
        setupView()

        buttons.forEach { $0.isSelected = ($0.tag == selectedIndex) }
    }
    
    private func deleteView() {
        let previousVC = viewControllers[previousIndex]
        previousVC.willMove(toParent: nil)
        previousVC.view.removeFromSuperview()
        previousVC.removeFromParent()
    }
    
    private func setupView() {
        let selectedVC = viewControllers[selectedIndex]
        
        self.addChild(selectedVC)
        view.insertSubview(selectedVC.view, belowSubview: tabBarView)
        
        selectedVC.view.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        selectedVC.didMove(toParent: self)
    }
    
    @objc private func tabBarButtonTapped(_ sender: TabBarButton) {
        selectedIndex = sender.tag
    }
}

extension NagazaTabBarController: TabBarDelegate {
    func shouldHideTabBar(_ hide: Bool) {
        tabBarView.isHidden = hide
    }
}
