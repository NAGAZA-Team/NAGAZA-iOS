//
//  RegionSettingFlowCoordinator.swift
//  Nagaza
//
//  Created by 전성훈 on 4/7/24.
//

import UIKit

//protocol RegionSettingFlowCoordinatorDependencies {
//    func makeRegionSettingViewController(
//        with subRegion: String,
//        didSelect: @escaping RegionSettingViewModelDidSelectAction
//    ) -> RegionSettingViewController
//}

final class RegionSettingCoordinator: BaseCoordinator {
    var regionSettingVC: NagazaViewController
    
    init(regionSettingVC: NagazaViewController) {
        self.regionSettingVC = regionSettingVC
    }
    
    override func start(navigationController: UINavigationController) {
        self.navigationController = navigationController
        
        regionSettingVC.setCoordinatorActions(with: self)
        
        navigationController.pushViewController(regionSettingVC, animated: false)
    }
    
//    func start() {
//        let didSelectAction: RegionSettingViewModelDidSelectAction = { [weak self] region in
//             // 사용자가 지역을 선택했을 때 수행할 작업
//             print("선택된 지역: \(region)")
//             // 예를 들어, 다른 코디네이터를 시작하거나, 상태를 업데이트할 수 있습니다.
//         }
//        
//        let vc = dependencies.makeRegionSettingViewController(with: "전국", didSelect: didSelectAction)
//        
//        navigationController.pushViewController(vc, animated: false)
//    }
//    
//    func start(
//        with subRegion: String,
//        didSelect: @escaping RegionSettingViewModelDidSelectAction
//    ) {
//        let vc = dependencies.makeRegionSettingViewController(with: subRegion, didSelect: didSelect)
//        
//        navigationController.pushViewController(vc, animated: false)
//    }
//    
//    private func dismiss() {
//        self.finish()
//    }
}

extension RegionSettingCoordinator: RegionSettingCoordinatorActions {
    func popViewController() {
        guard let navigationController = navigationController else { return }
        
        navigationController.popViewController(animated: true)
        
        DIManager.shared.unregisterRegionSettingPresentation()
        finishDelegate?.coordinatorDidFinish(childCoordinator: self)
    }
    
    func dismissController() {
        guard let navigationController = navigationController else { return }

        navigationController.dismiss(animated: true)
    }
}
