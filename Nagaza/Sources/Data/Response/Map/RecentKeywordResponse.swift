//
//  RecentKeywordResponse.swift
//  Nagaza
//
//  Created by SeungMin on 3/14/24.
//

struct RecentKeywordResponse: Decodable {
    let keywordList: [RecentKeywordResponseDTO]
    let page: Int
    let totalPages: Int
    
    enum CodingKeys: String, CodingKey {
        case keywordList
        case page
        case totalPages = "total_pages"
    }
}

struct RecentKeywordResponseDTO: Decodable {
    let keyword: String
}

extension RecentKeywordResponse {
    func toDomain() -> RecentKeywordPage {
        return RecentKeywordPage(
            keywordList: self.keywordList.map { $0.toDomain() },
            page: self.page,
            totalPages: self.totalPages
        )
    }
}

extension RecentKeywordResponseDTO {
    func toDomain() -> RecentKeyword {
        return RecentKeyword(
            keyword: self.keyword
        )
    }
}
