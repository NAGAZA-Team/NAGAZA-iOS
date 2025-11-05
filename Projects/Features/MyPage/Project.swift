//
//  Project.swift
//  NAGAZA-iOSManifests
//
//  Created by SeungMin on 5/15/24.
//

import ProjectDescription
import ProjectDescriptionHelpers
import MyPlugin

let project = Project(
    name: Feature.MyPage.rawValue,
    targets: [
        .feature(
            interface: .MyPage,
            dependencies: [
                .core,
                .domain
            ]
        ),
        .feature(
            implementation: .MyPage,
            dependencies: [
                .feature(interface: .MyPage),
                .feature(interface: .Auth),
                .dsKit,
            ]
        ),
        .feature(
            demo: .MyPage,
            dependencies: [
                .feature(implementation: .MyPage),
                .data,
            ]
        )
    ]
)
