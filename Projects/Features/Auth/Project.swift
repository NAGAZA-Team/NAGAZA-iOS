//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by SeungMin on 5/15/24.
//

import ProjectDescription
import ProjectDescriptionHelpers
import MyPlugin

let project = Project(
    name: Feature.Auth.rawValue,
    targets: [
        .feature(
            interface: .Auth,
            dependencies: [
                .core,
            ]
        ),
        .feature(
            implementation: .Auth,
            dependencies: [
                .feature(interface: .Auth),
                .dsKit
            ]
        )
    ]
)
