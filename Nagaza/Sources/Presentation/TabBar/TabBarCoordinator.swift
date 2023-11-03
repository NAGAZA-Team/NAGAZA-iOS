//
//  TabBarCoordinator.swift
//  Nagaza
//
//  Created by SeungMin on 2023/11/01.
//

import UIKit

protocol TabBarCoordinatorDependencies {
    func makeTabBarController() -> UITabBarController
    
    func makeMainDIContainer() -> MainDIContainer
    
    func makeMapDIContainer() -> MapDIContainer
    
    func makeReviewDIContainer() -> ReviewDIContainer
    
    func makeMyPageDIContainer() -> MyPageDIContainer
}

final class TabBarCoordinator {
    private let dependencies: TabBarCoordinatorDependencies
    
    init(dependencies: TabBarCoordinatorDependencies) {
        self.dependencies = dependencies
    }
    
    func start() {
        let tabBarController = dependencies.makeTabBarController()
        let mainDI = dependencies.makeMainDIContainer()
        let mapDI = dependencies.makeMapDIContainer()
        let reviewDI = dependencies.makeReviewDIContainer()
        let myPageDI = dependencies.makeMyPageDIContainer()
        
        let mainNavigationController = UINavigationController()
        let mapNavigationController = UINavigationController()
        let reviewNavigationController = UINavigationController()
        let myPageNavigationController = UINavigationController()
        
        let mainCoordinator = mainDI.makeMainCoordinator(navigationController: mainNavigationController)
        let mapCoordinator = mapDI.makeMapCoordinator(navigationController: mapNavigationController)
        let reviewCoordinator = reviewDI.makeReviewCoordinator(navigationController: reviewNavigationController)
        let myPageCoordinator = myPageDI.makeMyPageCoordinator(navigationController: myPageNavigationController)
        
        tabBarController.viewControllers = [
            createTabBarItem(navigationController: mainNavigationController,
                             title: "홈",
                             image: NagazaAsset.Images.home.image.withRenderingMode(.alwaysOriginal),
                             selectedImage: NagazaAsset.Images.home.image.withRenderingMode(.alwaysOriginal)),
            createTabBarItem(navigationController: mapNavigationController,
                             title: "지도",
                             image: NagazaAsset.Images.pin.image.withRenderingMode(.alwaysOriginal),
                             selectedImage: NagazaAsset.Images.pin.image.withRenderingMode(.alwaysOriginal)),
            createTabBarItem(navigationController: reviewNavigationController,
                             title: "리뷰",
                             image: NagazaAsset.Images.pen.image.withRenderingMode(.alwaysOriginal),
                             selectedImage: NagazaAsset.Images.pen.image.withRenderingMode(.alwaysOriginal)),
            createTabBarItem(navigationController: myPageNavigationController,
                             title: "마이",
                             image: NagazaAsset.Images.setting.image.withRenderingMode(.alwaysOriginal),
                             selectedImage: NagazaAsset.Images.setting.image.withRenderingMode(.alwaysOriginal))
        ]
        
        mainCoordinator.start()
        mapCoordinator.start()
        reviewCoordinator.start()
        myPageCoordinator.start()
        
        UIWindow.keyWindow?.rootViewController = tabBarController
        UIWindow.keyWindow?.makeKeyAndVisible()
    }
    
    private func createTabBarItem(navigationController: UINavigationController,
                                  title: String,
                                  image: UIImage,
                                  selectedImage: UIImage) -> UINavigationController {
        navigationController.tabBarItem = UITabBarItem(
            title: title,
            image: image,
            selectedImage: selectedImage
        )
        return navigationController
    }
}
