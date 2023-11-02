//
//  ReviewCoordinator.swift
//  Nagaza
//
//  Created by SeungMin on 2023/11/01.
//

import UIKit

protocol ReviewCoordinatorDependencies {
    func makeReviewViewController() -> ReviewViewController
}

final class ReviewCoordinator {
    private let navigationController: UINavigationController
    private let dependencies: ReviewCoordinatorDependencies
    
    init(navigationController: UINavigationController,
         dependencies: ReviewCoordinatorDependencies) {
        self.navigationController = navigationController
        self.dependencies = dependencies
    }
    
    func start() {
        let reviewViewController = dependencies.makeReviewViewController()
        navigationController.pushViewController(reviewViewController,
                                                animated: true)
    }
}

