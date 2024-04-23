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

final class MyPageCoordinator: BaseCoordinator {
    
    private var myPageVC: NagazaViewController
    
    init(myPageVC: NagazaViewController) {
        self.myPageVC = myPageVC
    }
    
    override func start(navigationController: UINavigationController) {
        self.navigationController = navigationController

        myPageVC.setCoordinatorActions(with: self)
        
        navigationController.setNavigationBarHidden(true, animated: false)
        navigationController.pushViewController(myPageVC, animated: false)
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

extension MyPageCoordinator: MyPageCoordinatorActions {
    func pushAppSetting() {
        guard let navigationController = navigationController else { return }
        
        let appSettingCoordinator = DIManager.shared.resolveAppSettingPresentation()
        
        addChildCoordinator(appSettingCoordinator)
        
        appSettingCoordinator.finishDelegate = self
        appSettingCoordinator.start(navigationController: navigationController)
    }
    
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

extension MyPageCoordinator: CoordinatorFinishDelegate {
    func coordinatorDidFinish(childCoordinator: Coordinator) {
        removeChildCoordinator(childCoordinator)
    }
}
