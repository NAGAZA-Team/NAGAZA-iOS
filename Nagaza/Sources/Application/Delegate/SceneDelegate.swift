//
//  SceneDelegate.swift
//  Nagaza
//
//  Created by SeungMin on 2023/10/18.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    let container = DIContainer.shared
    var window: UIWindow?
    var appCoordinator: AppFlowCoordinator?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
            
        self.window = setupWindow(for: windowScene)
        
        setupCoordinator()
    }
    
    private func setupWindow(for windowScene: UIWindowScene) -> UIWindow {
        let window = UIWindow(windowScene: windowScene)
        window.backgroundColor = .white
        
        return window
    }
    
    private func setupCoordinator() {
        if let window = self.window {
            appCoordinator = container.resolve(AppFlowCoordinator.self)
            appCoordinator?.start(with: window)
        }
    }
}
