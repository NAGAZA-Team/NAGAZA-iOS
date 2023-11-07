//
//  MyPageSceneDIContainer.swift
//  Nagaza
//
//  Created by 전성훈 on 2023/11/07.
//

import UIKit

final class MyPageSceneDIContainer: MyPageFlowCoordinatorDependencies {
    func makeMyPageViewController(actions: MyPageViewModelActions) -> MyPageViewController {
        MyPageViewController.create(with: makeMyPageViewModel(actions: actions))
    }
    
    private func makeMyPageViewModel(actions: MyPageViewModelActions) -> MyPageViewModel {
        MyPageViewModel(actions: actions)
    }
    
    func makeMyPageFlowCoordinator(navigationController: UINavigationController) -> MyPageFlowCoordinator {
        MyPageFlowCoordinator(
            navigationController: navigationController,
            dependencies: self
        )
    }
}
