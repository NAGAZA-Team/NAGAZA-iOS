//
//  SceneDelegate.swift
//  Nagaza
//
//  Created by SeungMin on 2023/10/18.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var appCoordinator: AppFlowCoordinator?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = (scene as? UIWindowScene),
              let splashViewController = DIContainer.shared.resolve(SplashViewController.self)
        else { return }
        
        let window = UIWindow(windowScene: windowScene)
        
        self.window = window

        self.window?.rootViewController = splashViewController
        self.window?.makeKeyAndVisible()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { [weak self] in
            self?.appCoordinator = AppFlowCoordinator(window: window)
            self?.appCoordinator?.start()
        }
    }
}
