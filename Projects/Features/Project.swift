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
    name: "Feature",
    targets: [
        .feature(
            dependencies: [
                .feature(implementation: .Home),
                .feature(implementation: .Map),
                .feature(implementation: .Review),
                .feature(implementation: .MyPage),
                .feature(implementation: .SignUp),
                .module(implementation: .Data, pathName: .Data)
            ]
        )
    ]
)

