//
//  RecentKeyword.swift
//  Nagaza
//
//  Created by SeungMin on 3/13/24.
//

import Foundation

enum SearchSection {
    case home
}

struct RecentKeyword: Hashable {
    let identifier = UUID()
    let keyword: String
}

struct RecentKeywordPage {
    let keywordList: [RecentKeyword]
    let page: Int
    let totalPages: Int
}

extension RecentKeyword {
  public func hash(into hasher: inout Hasher) {
    hasher.combine(identifier)
  }
    
  public static func == (lhs: RecentKeyword, rhs: RecentKeyword) -> Bool {
    lhs.identifier == rhs.identifier
  }
}
