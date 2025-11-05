//
//  Project.swift
//  NAGAZA-iOSManifests
//
//  Created by SeungMin on 5/15/24.
//

import ProjectDescription
import ProjectDescriptionHelpers
import MyPlugin

let project = Project.designSystem(
  name: Feature.DesignSystem.rawValue,
  dependencies: [
    .core,
    .external(.RxSwift),
    .external(.RxCocoa),
    .external(.SnapKit),
    .external(.Then),
    .external(.RxGesture),
//    .external(.Kingfisher),
    .external(.Lottie),
  ],
  infoPlist: .extendingDefault(with: infoPlistExtension(name: Feature.DesignSystem.rawValue))
)
