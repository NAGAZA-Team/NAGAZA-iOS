//
//  ReviewSceneDIContainer.swift
//  Nagaza
//
//  Created by SeungMin on 2023/11/01.
//

import UIKit

final class ReviewDIContainer {
    func makeReviewCoordinator(navigationController: UINavigationController) -> ReviewCoordinator {
        return ReviewCoordinator(
            navigationController: navigationController,
            dependencies: self
        )
    }
}

extension ReviewDIContainer: ReviewCoordinatorDependencies {
    func makeReviewViewController() -> ReviewViewController {
        return ReviewViewController()
    }
}
