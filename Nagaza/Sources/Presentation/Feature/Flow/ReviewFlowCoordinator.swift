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

final class ReviewFlowCoordinator: Coordinator {
    var type: CoordinatorType { .review }
    
    var childCoordinators: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    weak var finishDelegate: CoordinatorFinishDelegate?
    weak var tabBarDelegate: TabBarDelegate?
    
    private let dependencies: ReviewFlowCoordinatorDependencies!
    
    private weak var reviewVC: ReviewViewController?
    
    init(
        navigationController: UINavigationController,
        dependencies: ReviewFlowCoordinatorDependencies
    ) {
        self.navigationController = navigationController
        self.dependencies = dependencies
    }
    
    func start() {
        let actions = ReviewViewModelActions()
        let vc = dependencies.makeReviewViewController(actions: actions)
        
        navigationController.setNavigationBarHidden(true, animated: false)
        navigationController.pushViewController(vc, animated: false)
        
        reviewVC = vc
    }
}
