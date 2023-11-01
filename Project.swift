import ProjectDescription
import ProjectDescriptionHelpers

/*
 +-------------+
 |             |
 |     App     | Contains NAGAZAIOS App target and NAGAZAIOS unit-test target
 |             |
 +------+-------------+-------+
 |         depends on         |
 |                            |
 +----v-----+                   +-----v-----+
 |          |                   |           |
 |   Kit    |                   |     UI    |   Two independent frameworks to share code and start modularising your app
 |          |                   |           |
 +----------+                   +-----------+
 
 */

// MARK: - Project

// MARK: - ProjectFactory
protocol ProjectFactory {
    var projectName: String { get }
    var dependencies: [TargetDependency] { get }
    
    func generateTarget() -> [Target]
}

// MARK: - Constants
final class BaseProjectFactory: ProjectFactory {
    let projectName: String = "Nagaza"
    let organizationName: String = ""
    let bundleID: String = "com.scc.nagaza"
    let targetVersion: String = "15.0"
    
    let dependencies: [TargetDependency] = [
        .external(name: "FirebaseCrashlytics"),
        .external(name: "KakaoSDKCommon"),
        .external(name: "KakaoSDKAuth"),
        .external(name: "KakaoSDKUser"),
        .external(name: "Lottie"),
        .external(name: "RxSwift"),
        .external(name: "RxGesture"),
        .external(name: "RxDataSources"),
        .external(name: "RxMoya"),
        .external(name: "Moya"),
        .external(name: "SnapKit"),
        .external(name: "Then"),
    ]
    
    let infoPlist: [String: InfoPlist.Value] = [
        "CFBundleName": "NAGAZA",
        "CFBundleShortVersionString": "1.0.0",
        "CFBundleVersion": "1",
        "UILaunchStoryboardName": "LaunchScreen",
        "UIApplicationSceneManifest": [
            "UIApplicationSupportsMultipleScenes": false,
            "UISceneConfigurations": [
                "UIWindowSceneSessionRoleApplication": [
                    [
                        "UISceneConfigurationName": "Default Configuration",
                        "UISceneDelegateClassName": "$(PRODUCT_MODULE_NAME).SceneDelegate"
                    ],
                ]
            ]
        ],
        "App Transport Security Settings": ["Allow Arbitrary Loads": true],
        "Privacy - Photo Library Additions Usage Description": "프로필 사진 촬영을 위해서 권한 설정",
        "NSAppTransportSecurity": ["NSAllowsArbitraryLoads": true],
        "UIAppFonts": [
          "Item 0": "SpoqaHanSansNeo-Bold.ttf",
          "Item 1": "SpoqaHanSansNeo-Light.ttf",
          "Item 2": "SpoqaHanSansNeo-Medium.ttf",
          "Item 3": "SpoqaHanSansNeo-Regular.ttf",
          "Item 4": "SpoqaHanSansNeo-Thin.ttf"
        ],
        "UIUserInterfaceStyle": "Light"
    ]
    
    let projectSettings: Settings = .settings(
        base: [
            "OTHER_LDFLAGS": "-ObjC",
            "HEADER_SEARCH_PATHS": [
                "$(inherited)",
                "$(SRCROOT)/Tuist/Dependencies/SwiftPackageManager/.build/checkouts/gtm-session-fetcher/Sources/Core/Public"
            ]
        ]
    )
    
    let resourceSynthesizers: [ResourceSynthesizer] = [
//        .custom(
//            name: "Lottie",
//            parser: .json,
//            extensions: ["lottie"]
//        ),
        .assets(),
        .fonts()
    ]
    
    func generateTarget() -> [Target] {
        return [
            Target(name: projectName,
                   platform: .iOS,
                   product: .app,
                   bundleId: bundleID,
                   deploymentTarget: .iOS(targetVersion: targetVersion, devices: [.iphone]),
                   infoPlist: .extendingDefault(with: infoPlist),
                   sources: ["\(projectName)/Sources/**"],
                   resources: ["\(projectName)/Resources/**"],
                   dependencies: dependencies,
                   settings: projectSettings
                  ),
            
            Target(name: "\(projectName)Tests",
                   platform: .iOS,
                   product: .unitTests,
                   bundleId: "\(bundleID).Tests",
                   infoPlist: .extendingDefault(with: infoPlist),
                   sources: ["\(projectName)Tests/**"],
                   dependencies: [.target(name: projectName)],
                   settings: projectSettings
                  ),
            
            Target(name: "\(projectName)UITests",
                   platform: .iOS,
                   product: .uiTests,
                   bundleId: "\(bundleID).UITests",
                   infoPlist: .extendingDefault(with: infoPlist),
                   sources: ["\(projectName)UITests/**"],
                   dependencies: [.target(name: projectName)],
                   settings: projectSettings
                  ),
        ]
    }
    
    //      func generateConfigurations() -> Settings {
    //          Setting.settings(configurations: [
    //              .debug(name: , xcconfig: ),
    //              .release(name: , xcconfig: )
    //          ])
    //      }
}

// MARK: - Project
let factory = BaseProjectFactory()
let project = Project(name: factory.projectName,
                      organizationName: factory.organizationName,
                      settings: factory.projectSettings,
                      targets: factory.generateTarget(),
                      resourceSynthesizers: factory.resourceSynthesizers)
