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
        case .home: return NagazaAsset.Images.home.image
        case .map: return NagazaAsset.Images.pin.image
        case .review: return NagazaAsset.Images.pen.image
        case .myPage: return NagazaAsset.Images.setting.image
        }
    }
}

protocol TabBarDelegate: AnyObject {
    func shouldHideTabBar(_ hide: Bool)
}

final class NagazaTabBarController: UIViewController, TabBarDelegate {
    
    private lazy var viewControllers: [UIViewController] = []
    
    private lazy var buttons: [TabBarButton] = []
    
    private lazy var tabBarView: UIView = {
        let view = UIView()
        
        view.backgroundColor = .white
        
        return view
    }()
    
    var selectedIndex = 0 {
        willSet {
            previewsIndex = selectedIndex
        }
        didSet {
            updateView()
        }
    }
    
    private var previewsIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabBar()
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        print("TabBar Init")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        print("TabBar Deinit")
    }
    
    func setViewControllers(
        _ viewControllers: [UIViewController],
        with types: [TabBarType]
    ) {
        guard viewControllers.count == types.count else { return }
        
        self.viewControllers = viewControllers
        
        setupButtons(with: types)
        updateView()
    }
    
    private func setupTabBar() {
        view.addSubview(tabBarView)
        
        tabBarView.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(self.view.bounds.height / 10)
        }
    }
    
    private func setupButtons(with types: [TabBarType]) {
        let buttonWidth = view.bounds.width / CGFloat(types.count)
        
        for (index, type) in types.enumerated() {
            let button = TabBarButton()
            button.tag = index
            button.setupButton(title: type.title, image: type.icon)
            button.addTarget(self, action: #selector(tabBarButtonTapped(_:)), for: .touchUpInside)
            
            tabBarView.addSubview(button)
            buttons.append(button)
            
            button.snp.makeConstraints {
                $0.leading.equalToSuperview().offset(buttonWidth * CGFloat(index))
                $0.top.bottom.equalToSuperview()
                $0.width.equalTo(buttonWidth)
            }
        }
    }
    
    private func updateView() {
        deleteView()
        setupView()

        buttons.forEach { $0.isSelected = ($0.tag == selectedIndex) }
    }
    
    private func deleteView() {
        let previousVC = viewControllers[previewsIndex]
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
    
    func shouldHideTabBar(_ hide: Bool) {
        tabBarView.isHidden = hide
    }
}
