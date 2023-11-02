//
//  AppDIContainer.swift
//  Nagaza
//
//  Created by 전성훈 on 2023/10/19.
//

import Foundation

struct AppDIContainer {
    func makeTabBarSceneDIContainer() -> TabBarDIContainer {
        return TabBarDIContainer()
    }
    
    func makeLoginSceneDIContainer() -> LoginDIContainer {
        return LoginDIContainer()
    }
}
