//
//  MyPageAppSettingCoordinator.swift
//  Nagaza
//
//  Created by 강조은 on 3/23/24.
//

import UIKit

final class AppSettingCoordinator: BaseCoordinator {
//    private var dependencies: MyPageFlowCoordinatorDependencies!
    
    private var appSettingVC: NagazaViewController
    
    init(appSettingVC: NagazaViewController) {
        self.appSettingVC = appSettingVC
    }
    
//    init(
//        navigationController: UINavigationController,
//        dependencies: MyPageFlowCoordinatorDependencies
//    ) {
//        super.init(navigationController: navigationController)
//        self.dependencies = dependencies
//    }
    
    override func start(navigationController: UINavigationController) {
        self.navigationController = navigationController

        appSettingVC.setCoordinatorActions(with: self)
        
        navigationController.pushViewController(appSettingVC, animated: true)
    }
    
//    override func start() {
//        let actions = MyPageAppSettingViewModelActions(finishMyPageAppSettingVC: finishView)
//        let vc = dependencies.makeMyPageAppSettingViewController(actions: actions)
//        viewController = vc
//        
//        navigationController.pushViewController(vc, animated: true)
//    }
}

extension AppSettingCoordinator: AppSettingCoordinatorActions {
    
}

extension AppSettingCoordinator {
    func finishView() {
        navigationController?.popViewController(animated: true)
        finishDelegate?.coordinatorDidFinish(childCoordinator: self)
    }
}
