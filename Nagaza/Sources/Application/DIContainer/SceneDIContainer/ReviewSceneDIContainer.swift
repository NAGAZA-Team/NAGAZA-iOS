//
//  ReviewSceneDIContainer.swift
//  Nagaza
//
//  Created by 전성훈 on 2023/11/07.
//

import UIKit

final class ReviewSceneDIContainer: ReviewFlowCoordinatorDependencies {
    func makeReviewViewController(actions: ReviewViewModelActions) -> ReviewViewController {
        ReviewViewController.create(with: makeReviewViewModel(actions: actions))
    }
    
    private func makeReviewViewModel(actions: ReviewViewModelActions) -> ReviewViewModel {
        ReviewViewModel(actions: actions)
    }
    
    func makeReviewFlowCoordinator(navigationController: UINavigationController) -> ReviewFlowCoordinator {
        ReviewFlowCoordinator(
            navigationController: navigationController,
            dependencies: self
        )
    }
}
