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
    name: Feature.SignUp.rawValue,
    targets: [
        .feature(
            interface: .SignUp,
            dependencies: [
                .core,
            ]
        ),
        .feature(
            implementation: .SignUp,
            dependencies: [
                .feature(interface: .SignUp),
                .feature(interface: .Auth),
                .dsKit
            ]
        ),
        .feature(
            demo: .SignUp,
            dependencies: [
                .feature(implementation: .SignUp)
            ]
        )
    ]
)
