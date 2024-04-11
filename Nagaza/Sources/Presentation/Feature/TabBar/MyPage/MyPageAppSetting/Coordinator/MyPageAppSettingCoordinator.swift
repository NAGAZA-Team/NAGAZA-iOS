//
//  MyPageAppSettingCoordinator.swift
//  Nagaza
//
//  Created by 강조은 on 3/23/24.
//

import UIKit

final class MyPageAppSettingCoordinator: BaseCoordinator {
    private var dependencies: MyPageFlowCoordinatorDependencies!
    
    init(
        navigationController: UINavigationController,
        dependencies: MyPageFlowCoordinatorDependencies
    ) {
        super.init(navigationController: navigationController)
        self.dependencies = dependencies
    }
    
    override func start() {
        let actions = MyPageAppSettingViewModelActions(finishMyPageAppSettingVC: finishView)
        let vc = dependencies.makeMyPageAppSettingViewController(actions: actions)
        viewController = vc
        
        navigationController.pushViewController(vc, animated: true)
    }
}

extension MyPageAppSettingCoordinator {
    func finishView() {
        navigationController.popViewController(animated: true)
        finishDelegate?.coordinatorDidFinish(childCoordinator: self)
    }
}
