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
    name: Feature.Map.rawValue,
    targets: [
        .feature(
            interface: .Map,
            dependencies: [
                .core,
                .domain
            ]
        ),
        .feature(
            implementation: .Map,
            dependencies: [
                .feature(interface: .Map),
                .feature(interface: .Auth),
                .dsKit,
            ]
        ),
        .feature(
            demo: .Map,
            dependencies: [
                .feature(implementation: .Map),
                .data,
            ]
        )
    ]
)
