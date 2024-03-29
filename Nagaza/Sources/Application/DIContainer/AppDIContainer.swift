//
//  AppDIContainer.swift
//  Nagaza
//
//  Created by 전성훈 on 2023/10/19.
//

import UIKit

final class AppDIContainer {
    // Data Service 추가 후 해당 DIContainer에 추가
    
    func makeLoginSceneDIContainer() -> LoginSceneDIContainer {
        return LoginSceneDIContainer()
    }
    
    func makeHomeSceneDIContainer() -> HomeSceneDIContainer {
        let dependencise = HomeSceneDIContainer.Dependencies()
        
        return HomeSceneDIContainer(dependencies: dependencise)
    }
    
    func makeMapSceneDIContainer() -> MapSceneDIContainer {
        return MapSceneDIContainer()
    }
    
    func makeReviewSceneDIContainer() -> ReviewSceneDIContainer {
        return ReviewSceneDIContainer()
    }
    
    func makeMyPageSceneDIContainer() -> MyPageSceneDIContainer {
        return MyPageSceneDIContainer()
    }
}

