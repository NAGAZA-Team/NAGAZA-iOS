//
//  Project.swift
//  NAGAZA-iOSManifests
//
//  Created by SeungMin on 5/15/24.
//

import ProjectDescription
import ProjectDescriptionHelpers
import MyPlugin

let project = Project.dynamicFramework(
    name: Feature.ThirdPartyLibs.rawValue,
    dependencies: [
//        .external(.SnapKit),
        .external(.Moya),
        .external(.RxMoya),
//        .external(.Then),
        //        .external(.Starscream),
        .external(.RxSwift),
        .external(.RxCocoa),
//        .external(.RxKeyboard),
//        .external(.Kingfisher),
//        .external(.Lottie),
        //        .external(.Fierbase),
//        .external(.RxGesture),
        .external(.RxDataSources)
    ]
)
