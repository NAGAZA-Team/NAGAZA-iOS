//
//  Target+Templates.swift
//  NAGAZA-iOSManifests
//
//  Created by SeungMin on 5/15/24.
//

import ProjectDescription
import MyPlugin

private let rootPackagesName = "com.nagaza."
private let basicDeployment: DeploymentTarget = .iOS(targetVersion: "15.0", devices: .iphone)
//private let projectSettings: Settings = .settings(
//    base: [
//        "OTHER_LDFLAGS": "-ObjC",
//        "HEADER_SEARCH_PATHS": [
//            "$(inherited)",
//            "$(SRCROOT)/Tuist/Dependencies/SwiftPackageManager/.build/checkouts/gtm-session-fetcher/Sources/Core/Public"
//        ]
//    ]
//)

private func makeBundleID(with addition: String) -> String {
    (rootPackagesName + addition).lowercased()
}

public extension Target {
    
    
    static func makeApp(
        name: String,
        sources: ProjectDescription.SourceFilesList,
        dependencies: [ProjectDescription.TargetDependency]
    ) -> Target {
        Target(
            name: name,
            platform: .iOS,
            product: .app,
            bundleId: makeBundleID(with: "app"),
            deploymentTarget: basicDeployment,
            infoPlist: .extendingDefault(with: infoPlistExtension),
            sources: sources,
            resources:  [.glob(pattern: .relativeToRoot("Projects/App/Resource/**"))],
            dependencies: dependencies
//            settings: projectSettings
        )
    }

  private static func makeDemoApp(
    name: String,
    sources: SourceFilesList,
    resources: ResourceFileElements? = [],
    dependencies: [TargetDependency]
  ) -> Target {
    Target(
      name: name,
      platform: .iOS,
      product: .app,
      bundleId: makeBundleID(with: "demo." + name + "app"),
      deploymentTarget: basicDeployment,
      infoPlist: .extendingDefault(with: infoPlistExtension(name: "Demo\(name)")),
      sources: sources,
      resources:  resources,
      dependencies: dependencies
//      settings: projectSettings
    )
  }

    static func makeFramework(
        name: String,
        sources: ProjectDescription.SourceFilesList,
        dependencies: [ProjectDescription.TargetDependency] = [],
        resources: ProjectDescription.ResourceFileElements? = []
    ) -> Target {
        Target(
            name: name,
            platform: .iOS,
            product: defaultPackageType,
            bundleId: makeBundleID(with: name + ".framework"),
            deploymentTarget: basicDeployment,
            sources: sources,
            resources: resources,
            dependencies: dependencies
//            settings: projectSettings
        )
    }

    private static func feature(
        implementation featureName: String,
        dependencies: [ProjectDescription.TargetDependency] = [],
        resources: ProjectDescription.ResourceFileElements? = []
    ) -> Target {
        .makeFramework(
            name: featureName,
            sources: [ "Source/**" ],
            dependencies: dependencies,
            resources: resources
        )
    }

    private static func feature(
        interface featureName: String,
        dependencies: [ProjectDescription.TargetDependency] = [],
        resources: ProjectDescription.ResourceFileElements? = []
    ) -> Target {
        .makeFramework(
            name: featureName + "Interface",
            sources: [ "Interface/Source/**" ],
            dependencies: dependencies,
            resources: resources
        )
    }

  private static func feature(
    demo featureName: String,
    dependencies: [TargetDependency] = [],
    resources: ResourceFileElements? = []
  ) -> Target {
    .makeDemoApp(
      name: featureName + "Demo",
      sources: [ "Demo/Source/**" ],
      resources: resources,
      dependencies: dependencies
    )
  }

    static func feature(
        implementation featureName: Feature,
        dependencies: [ProjectDescription.TargetDependency] = [],
        resources: ProjectDescription.ResourceFileElements? = []
    ) -> Target {
        .feature(
            implementation: featureName.rawValue,
            dependencies: dependencies,
            resources: resources
        )
    }

    static func feature(
        interface featureName: Feature,
        dependencies: [ProjectDescription.TargetDependency] = [],
        resources: ProjectDescription.ResourceFileElements? = []
    ) -> Target {
        .feature(
            interface: featureName.rawValue,
            dependencies: dependencies,
            resources: resources
        )
    }

  static func feature(
    demo featureName: Feature,
    dependencies: [TargetDependency] = [],
    resources: ResourceFileElements? = [.glob(pattern: .relativeToRoot("Projects/App/Resource/**"))]
  ) -> Target {
    .feature(
      demo: featureName.rawValue,
      dependencies: dependencies,
      resources: resources
    )
  }

    static func feature(
        dependencies: [ProjectDescription.TargetDependency] = []
    ) -> Target {
        .makeFramework(
            name: "Feature",
            sources: "Source/**",
            dependencies: dependencies
        )
    }
}



