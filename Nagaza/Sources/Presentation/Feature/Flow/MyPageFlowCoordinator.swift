//
//  MyPageFlowCoordinator.swift
//  Nagaza
//
//  Created by 전성훈 on 2023/11/07.
//

import UIKit

protocol MyPageFlowCoordinatorDependencies {
    func makeMyPageViewController(actions: MyPageViewModelActions) -> MyPageViewController
}

final class MyPageFlowCoordinator: Coordinator {
    var type: CoordinatorType { .myPage }
    
    var childCoordinators: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    weak var finishDelegate: CoordinatorFinishDelegate?
    weak var tabBarDelegate: TabBarDelegate?
    
    private let dependencies: MyPageFlowCoordinatorDependencies!
    
    private weak var myPageVC: MyPageViewController?
    
    init(
        navigationController: UINavigationController,
        dependencies: MyPageFlowCoordinatorDependencies
    ) {
        self.navigationController = navigationController
        self.dependencies = dependencies
    }
    
    func start() {
        let actions = MyPageViewModelActions()
        let vc = dependencies.makeMyPageViewController(actions: actions)
        
        navigationController.setNavigationBarHidden(true, animated: false)
        navigationController.pushViewController(vc, animated: false)
        
        myPageVC = vc
    }
}
