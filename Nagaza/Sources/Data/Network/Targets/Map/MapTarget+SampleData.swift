//
//  MapTarget+SampleData.swift
//  Nagaza
//
//  Created by SeungMin on 3/14/24.
//

import Foundation

import Moya

extension MapTarget {
    var sampleData: Data {
        switch self {
        case .fetchRecentKeywordList:
            return Data(
    """
    {
        "keywordList": [
            {
                "keyword": "리그오브디저트"
            },
            {
                "keyword": "방탈출"
            },
            {
                "keyword": "풀문"
            },
            {
                "keyword": "마스터키"
            }
        ],
        "page": 1,
        "total_pages": 1
    }
    """.utf8)
        }
    }
}
