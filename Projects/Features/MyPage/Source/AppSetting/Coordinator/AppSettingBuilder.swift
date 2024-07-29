//
//  AppSettingBuilder.swift
//  MyPageInterface
//
//  Created by SeungMin on 5/22/24.
//

import Core
import MyPageInterface

public final class AppSettingBuilder: AppSettingBuildable {
    public init() { }
    public func build(rootViewControllable: ViewControllable) -> AppSettingCoordinating {
        
        let coordinator = AppSettingCoordinator(viewControllable: rootViewControllable)
        coordinator.start()
        return coordinator
    }
}
