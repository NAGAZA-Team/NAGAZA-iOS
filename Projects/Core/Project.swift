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
    name: Feature.Core.rawValue,
    targets: [
        .feature(
            implementation: .Core,
            dependencies: [
                .module(implementation: .ThirdPartyLibs, pathName: .Modules(.ThirdPartyLibs)),
                .domain,
            ]
        ),
    ]
)
