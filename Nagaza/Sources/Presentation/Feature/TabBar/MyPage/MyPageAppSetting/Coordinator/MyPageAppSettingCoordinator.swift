//
//  MyPageAppSettingCoordinator.swift
//  Nagaza
//
//  Created by 강조은 on 3/23/24.
//

import UIKit

final class MyPageAppSettingCoordinator: Coordinator {
    var type: CoordinatorType = .myPageAppSetting
    
    var tabBarDelegate: TabBarDelegate?
    
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    var viewController: UIViewController = UIViewController()
    
    weak var finishDelegate: CoordinatorFinishDelegate?
    private let dependencies: MyPageFlowCoordinatorDependencies!
    
    init(
        navigationController: UINavigationController,
        dependencies: MyPageFlowCoordinatorDependencies
    ) {
        self.navigationController = navigationController
        self.dependencies = dependencies
    }
    
    func start() {
        viewController = MyPageAppSettingViewController()
    }
    
    private func showTabBar() {
        self.finish()
    }
}
