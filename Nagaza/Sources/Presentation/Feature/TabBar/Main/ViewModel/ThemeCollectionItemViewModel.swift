//
//  ThemeCollectionItemViewModel.swift
//  Nagaza
//
//  Created by 전성훈 on 2023/12/01.
//

import Foundation

struct ThemeCollectionItemViewModel: Equatable {
    let themePosterImagePath: String?
    let isHeart: Bool
    let title: String
    let branch: String
    let rated: Double
    let category: RatedCategory
}
