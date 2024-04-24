//
//  SceneDelegate.swift
//  Nagaza
//
//  Created by SeungMin on 2023/10/18.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    let container = DIContainer.sharedContainer()
    var window: UIWindow?
    var appCoordinator: AppCoordinator?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
            
        /// scene delegate 테스트 코드에서 실행 안되도록하는 조치 ->  역할별 테스트 명확성을 위해
        /// 참고: https://stackoverflow.com/questions/27500940/how-to-let-the-app-know-if-its-running-unit-tests-in-a-pure-swift-project
        #if DEBUG
        if ProcessInfo.processInfo.environment["XCTestConfigurationFilePath"] != nil {
            window?.rootViewController = UIViewController()
            window?.makeKeyAndVisible()
            
            return
        }
        #endif
        
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
            appCoordinator = container.resolve(AppCoordinator.self)
            appCoordinator?.start(with: window)
        }
    }
}
