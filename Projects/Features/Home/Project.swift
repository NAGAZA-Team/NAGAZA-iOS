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
    name: Feature.Home.rawValue,
    targets: [
        .feature(
            interface: .Home,
            dependencies: [
                .core,
                .domain
            ]
        ),
        .feature(
            implementation: .Home,
            dependencies: [
                .feature(interface: .Home),
                .feature(interface: .Auth),
                .dsKit,
            ]
        ),
        .feature(
            demo: .Home,
            dependencies: [
                .feature(implementation: .Home),
                .data,
            ]
        )
    ]
)
