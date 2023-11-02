//
//  TabBarDIContainer.swift
//  Nagaza
//
//  Created by SeungMin on 2023/11/01.
//

import UIKit

struct TabBarDIContainer {
    func makeTabBarCoordinator() -> TabBarCoordinator {
        return TabBarCoordinator(
            dependencies: self
        )
    }
}

extension TabBarDIContainer: TabBarCoordinatorDependencies {
    func makeTabBarController() -> UITabBarController {
        return UITabBarController()
    }
    
    func makeMainDIContainer() -> MainDIContainer {
        return MainDIContainer()
    }
    
    func makeMapDIContainer() -> MapDIContainer {
        return MapDIContainer()
    }
    
    func makeReviewDIContainer() -> ReviewDIContainer {
        return ReviewDIContainer()
    }
    
    func makeMyPageDIContainer() -> MyPageDIContainer {
        return MyPageDIContainer()
    }
}
