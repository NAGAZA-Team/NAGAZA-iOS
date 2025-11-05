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
    name: Feature.Data.rawValue,
    targets: [
        .feature(
            implementation: .Data,
            dependencies: [
                .feature(interface: .Home),
                .feature(interface: .Map),
                .feature(interface: .Review),
                .feature(interface: .MyPage),
                .feature(interface: .SignUp),
                .module(implementation: .Network, pathName: .Modules(.Network))
            ]
        )
    ]
)
