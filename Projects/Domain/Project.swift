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
    name: Feature.Domain.rawValue,
    targets: [
        .feature(
            implementation: .Domain,
            dependencies: [
            ]
        ),
    ]
)
