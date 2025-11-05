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
    name: Feature.Review.rawValue,
    targets: [
        .feature(
            interface: .Review,
            dependencies: [
                .core,
                .domain
            ]
        ),
        .feature(
            implementation: .Review,
            dependencies: [
                .feature(interface: .Review),
                .feature(interface: .Auth),
                .dsKit,
            ]
        ),
        .feature(
            demo: .Review,
            dependencies: [
                .feature(implementation: .Review),
                .data,
            ]
        )
    ]
)
