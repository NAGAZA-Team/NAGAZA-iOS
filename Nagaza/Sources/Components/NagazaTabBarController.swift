//
//  NagazaTabBarController.swift
//  Nagaza
//
//  Created by SeungMin on 2023/11/01.
//

import UIKit

protocol TabBarDependnecy: AnyObject {
    var tabBarHeight: CGFloat { get }
}

final class TabBarComponent: TabBarDependnecy {
    var tabBarHeight: CGFloat = 56
}

final class NagazaTabBarController: UITabBarController {
    private let dependnecy: TabBarDependnecy
    init(dependency: TabBarDependnecy) {
        self.dependnecy = dependency
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) hazs not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setAppearance()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tabBar.frame.size.height = dependnecy.tabBarHeight + UIWindow.safeAreaInsetBottom
        tabBar.frame.origin.y = self.view.frame.height - tabBar.frame.size.height
    }
    
    private func setAppearance() {
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.backgroundColor = .white
        tabBarAppearance.shadowColor = .white
        self.tabBar.isTranslucent = false
        
        setTabItemAppearence(tabBarAppearance.stackedLayoutAppearance)
        self.tabBar.standardAppearance = tabBarAppearance
        self.tabBar.scrollEdgeAppearance = tabBarAppearance
    }
    
    private func setTabItemAppearence(_ itemAppearance: UITabBarItemAppearance) {
//        itemAppearance.normal.titleTextAttributes = [
//            .foregroundColor: NagazaAsset.Color.unSelected.color,
//            .font: UIFont.thtCaption1M
//        ]
//        itemAppearance.selected.titleTextAttributes = [
//            .foregroundColor: NagazaAsset.Color.neutral50.color,
//            .font: UIFont.thtCaption1M
//        ]
    }
}
