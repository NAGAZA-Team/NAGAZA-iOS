//
//  DIProvider.swift
//  Nagaza
//
//  Created by 전성훈 on 4/22/24.
//

import Foundation

final class DIManager {
    static let shared = DIManager()

    let container = DIContainer.sharedContainer()
    let register = DIRegister.shared

    private init() { }
    
    // MARK: - 공통 메서드
    /// 지정된 타입의 코디네이터를 DIContainer에서 검색합니다.
    /// 만약 DIContainer에 해당 코디네이터가 등록되어 있지 않으면,
    /// 주어진 registerAction을 실행하여 코디네이터를 등록한 후 다시 검색합니다.
    /// 등록 후에도 코디네이터를 찾지 못하면 fatalError를 발생시켜 실행을 중단합니다.
    /// - Parameters:
    ///   - type: 해결하려는 코디네이터의 타입
    ///   - registerAction: 코디네이터가 없을 때 실행할 등록 함수
    /// - Returns: 요청된 타입의 코디네이터 인스턴스를 반환합니다.
    ///            실패시 fatalError가 발생하여 앱이 종료됩니다.
    private func resolveCoordinator<T: BaseCoordinator>(
        type: T.Type,
        registerAction: () -> Void
    ) -> T {
        if let coordinator = container.resolve(type) {
            return coordinator
        } else {
            registerAction()
            guard let reResolvedCoordinator = container.resolve(type) else {
                fatalError("\(type) 재등록 실패")
            }
            
            return reResolvedCoordinator
        }
    }
    
    /// DIContainer에서 주어진 타입 목록에 해당하는 모든 클래스 인스턴스를 제거합니다.
    /// 이 메서드는 주로 프레젠테이션 계층(뷰 모델, 뷰 컨트롤러, 코디네이터 등)의 인스턴스를
    /// 메모리 해제 및 의존성 컨테이너에서 제거할 때 사용됩니다.
    /// - Parameter types: 제거할 클래스 타입의 배열. 이 배열은 AnyObject.Type을 구현하는 모든 타입을 포함할 수 있습니다.
    private func unregisterPresentation(types: [AnyObject.Type]) {
        print("----------삭제 시작---------")

        types.forEach { type in
            container.unregister(type)
        }
        
        print("----------삭제 종료---------")
    }
    
    // MARK: - TabBar Presentation
    func resolveTabBarPresentation() -> [BaseCoordinator] {
        let coordinatorTypes: [BaseCoordinator.Type] = [
                 TabBarCoordinator.self,
                 HomeCoordinator.self,
                 MapCoordinator.self,
                 ReviewCoordinator.self,
                 MyPageCoordinator.self
             ]
                
        return coordinatorTypes.compactMap { type in
            resolveCoordinator(
                type: type,
                registerAction: register.registerTabBarsPresentation
            )
        }
    }
    
    func unregisterTabBarPresentation() {
        let viewModelTypes: [AnyObject.Type] = [
            HomeViewModel.self,
            MapViewModel.self,
            ReviewViewModel.self,
            MyPageViewModel.self
        ]
        
        let viewControllerTypes: [AnyObject.Type] = [
            NagazaTabBarController.self,
            HomeViewController.self,
            MapViewController.self,
            ReviewViewController.self,
            MyPageViewController.self
        ]
        
        let coordinatorTypes: [AnyObject.Type] = [
            TabBarCoordinator.self,
            HomeCoordinator.self,
            MapCoordinator.self,
            ReviewCoordinator.self,
            MyPageCoordinator.self
        ]
 
        let allTypes = viewModelTypes + viewControllerTypes + coordinatorTypes
        
        unregisterPresentation(types: allTypes)
    }
    
    // MARK: - Login Presentation
    func resolveLoginPresentation() -> LoginCoordinator {
        resolveCoordinator(
            type: LoginCoordinator.self,
            registerAction: register.registerLoginPresentation
        )
    }
    
    func unregisterLoginPresentation() {
        let loginPresentations: [AnyObject.Type] = [
            LoginViewModel.self,
            LoginViewController.self,
            LoginCoordinator.self
        ]
        
        unregisterPresentation(types: loginPresentations)
    }
    
    // MARK: - Region Setting Presentation
    func resolveRegionSettingPresentation() -> RegionSettingCoordinator {
        resolveCoordinator(
            type: RegionSettingCoordinator.self,
            registerAction: register.registerRegionSettingPresentation
        )
    }
    
    func unregisterRegionSettingPresentation() {
        let regionSettingPresetations: [AnyObject.Type] = [
            RegionSettingViewModel.self,
            RegionSettingViewController.self,
            RegionSettingCoordinator.self
        ]
        
        unregisterPresentation(types: regionSettingPresetations)
    }
    
    // MARK: - Map Search Presentation
    func resolveMapSearchPresentation() -> MapSearchCoordinator {
        resolveCoordinator(
            type: MapSearchCoordinator.self,
            registerAction: register.registerMapSearchPresentation
        )
    }
    
    func unregisterMapSearchPresentation() {
        let mapSearchPresentations: [AnyObject.Type] = [
            MapSearchViewModel.self,
            MapSearchViewController.self,
            MapSearchCoordinator.self
        ]
        
        unregisterPresentation(types: mapSearchPresentations)
    }
    
    // MARK: - App Setting Presentation
    func resolveAppSettingPresentation() -> AppSettingCoordinator {
        resolveCoordinator(
            type: AppSettingCoordinator.self,
            registerAction: register.registerAppSettingPresentation
        )
    }
    
    func unregisterAppSettingPresentation() {
        let appSettingPresentation: [AnyObject.Type] = [
            AppSettingViewModel.self,
            AppSettingViewController.self,
            AppSettingCoordinator.self
        ]
        
        unregisterPresentation(types: appSettingPresentation)
    }
}
