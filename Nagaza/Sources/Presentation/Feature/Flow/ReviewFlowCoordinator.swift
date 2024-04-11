//
//  ReviewFlowCoordinator.swift
//  Nagaza
//
//  Created by 전성훈 on 2023/11/07.
//

import UIKit

protocol ReviewFlowCoordinatorDependencies {
    func makeReviewViewController(actions: ReviewViewModelActions) -> ReviewViewController
}

final class ReviewFlowCoordinator: BaseCoordinator {
    private let dependencies: ReviewFlowCoordinatorDependencies!
    
    init(
        navigationController: UINavigationController,
        dependencies: ReviewFlowCoordinatorDependencies
    ) {
        self.dependencies = dependencies
        super.init(navigationController: navigationController)
    }
    
    override func start() {
        let actions = ReviewViewModelActions()
        let vc = dependencies.makeReviewViewController(actions: actions)
        viewController = vc
        
        navigationController.setNavigationBarHidden(true, animated: false)
        navigationController.pushViewController(vc, animated: false)
    }
}
