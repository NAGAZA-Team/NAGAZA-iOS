//
//  MyPageAppSettingCoordinator.swift
//  Nagaza
//
//  Created by 강조은 on 3/23/24.
//

import UIKit

final class AppSettingCoordinator: BaseCoordinator {
    private var appSettingVC: NagazaViewController
    
    init(appSettingVC: NagazaViewController) {
        self.appSettingVC = appSettingVC
    }
    
    override func start(navigationController: UINavigationController) {
        self.navigationController = navigationController

        appSettingVC.setCoordinatorActions(with: self)
        
        navigationController.pushViewController(appSettingVC, animated: true)
    }
}

extension AppSettingCoordinator: AppSettingCoordinatorActions {
    func popViewController() {
        guard let navigationController = navigationController else { return }
        
        DIManager.shared.unregisterAppSettingPresentation()
        
        navigationController.popViewController(animated: true)
        finishDelegate?.coordinatorDidFinish(childCoordinator: self)
    }
}
