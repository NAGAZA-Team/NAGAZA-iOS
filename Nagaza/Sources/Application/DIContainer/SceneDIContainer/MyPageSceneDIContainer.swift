//
//  MyPageSceneDIContainer.swift
//  Nagaza
//
//  Created by 전성훈 on 2023/11/07.
//

import UIKit

final class MyPageSceneDIContainer: MyPageFlowCoordinatorDependencies {
    func makeMyPageFlowCoordinator(navigationController: UINavigationController) -> MyPageFlowCoordinator {
        MyPageFlowCoordinator(
            navigationController: navigationController,
            dependencies: self
        )
    }
}

// MARK: - 마이페이지 메인
extension MyPageSceneDIContainer {
    func makeMyPageViewController(actions: MyPageViewModelActions) -> MyPageViewController {
        MyPageViewController.create(with: makeMyPageViewModel(actions: actions))
    }
    
    private func makeMyPageViewModel(actions: MyPageViewModelActions) -> MyPageViewModel {
        MyPageViewModel(actions: actions)
    }
}

// MARK: - 마이페이지 - 앱 설정
extension MyPageSceneDIContainer {
    func makeMyPageAppSettingViewController(actions: MyPageAppSettingViewModelActions) -> MyPageAppSettingViewController {
        MyPageAppSettingViewController.create(with: makeMyPageAppSettingViewModel(actions: actions))
    }
    
    private func makeMyPageAppSettingViewModel(actions: MyPageAppSettingViewModelActions) -> MyPageAppSettingViewModel {
        MyPageAppSettingViewModel(actions: actions)
    }
}
