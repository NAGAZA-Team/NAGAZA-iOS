//
//  MyPageCoordinator.swift
//  MyPageInterface
//
//  Created by SeungMin on 5/22/24.
//

import Core
import MyPageInterface

public final class MyPageCoordinator: BaseCoordinator, MyPageCoordinating {
//    @Injected var homeUseCase: HomeUseCaseProtocol
    
    public weak var delegate: MyPageCoordinatorDelegate?
    
    public override func start() {
        homeFlow()
    }
    
    public func homeFlow() {
        let viewModel = MyPageViewModel()
        viewModel.setCoordinatorActions(with: self)
        let viewController = MyPageViewController(viewModel: viewModel)
        viewControllable.setViewControllers([viewController])
    }
}

extension MyPageCoordinator: MyPageCoordinatorActions {
    func pushAppSetting() {
        let coordinator = AppSettingBuilder().build(rootViewControllable: self.viewControllable)
        coordinator.finishDelegate = self
        attachChild(coordinator)
    }
}

extension MyPageCoordinator: CoordinatorFinishDelegate {
    public func coordinatorDidFinish(childCoordinator: Coordinator) {
        viewControllable.popViewController(animated: true)
        detachChild(childCoordinator)
    }
}
