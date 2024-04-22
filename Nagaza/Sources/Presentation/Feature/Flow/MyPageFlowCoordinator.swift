//
//  MyPageFlowCoordinator.swift
//  Nagaza
//
//  Created by 전성훈 on 2023/11/07.
//

import UIKit

//protocol MyPageFlowCoordinatorDependencies {
//    func makeMyPageViewController(actions: MyPageViewModelActions) -> MyPageViewController
//    func makeMyPageAppSettingViewController(actions: MyPageAppSettingViewModelActions) -> MyPageAppSettingViewController
//}

final class MyPageFlowCoordinator: BaseCoordinator {
    
    private var myPageVC: UIViewController
    
    init(myPageVC: UIViewController) {
        self.myPageVC = myPageVC
    }
    
    override func start(navigationController: UINavigationController) {
        navigationController.setNavigationBarHidden(true, animated: false)
        navigationController.pushViewController(myPageVC, animated: false)
        
        self.navigationController = navigationController
    }
    
//    override func start() {
//        let actions = MyPageViewModelActions(moveAppSetting: moveAppSetting)
//        let vc = dependencies.makeMyPageViewController(actions: actions)
//        viewController = vc
//        
//        navigationController.setNavigationBarHidden(true, animated: false)
//        navigationController.pushViewController(vc, animated: false)
//    }
}

extension MyPageFlowCoordinator {
//    func moveAppSetting() {
//        let coordinator = MyPageAppSettingCoordinator(
//            navigationController: navigationController,
//            dependencies: dependencies
//        )
//        coordinator.start()
//        coordinator.finishDelegate = self
//        childCoordinators.append(coordinator)
//    }
}

extension MyPageFlowCoordinator: CoordinatorFinishDelegate {
    func coordinatorDidFinish(childCoordinator: Coordinator) {
        removeChildCoordinator(childCoordinator)
    }
}
