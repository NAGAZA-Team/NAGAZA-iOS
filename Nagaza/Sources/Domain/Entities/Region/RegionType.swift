//
//  Region.swift
//  Nagaza
//
//  Created by 전성훈 on 2024/02/19.
//

import Foundation

enum RegionType: CaseIterable {
    case nationwide
    case seoul
    case gyeonggi
    case chungcheong
    case gyeongsang
    case jeolla
    case gangwon
    case jeju
    
    static let regionCities: [RegionType: [String]] = [
        .nationwide: ["전국"],
        .seoul: ["서울", "강남", "건대", "홍대", "신촌", "대학로", "강북", "신림", "서울 기타"],
        .gyeonggi: ["경기도", "인천", "부천", "일산", "수원", "안양", "경기도 기타"],
        .chungcheong: ["충청도", "대전", "천안", "청주", "충청도 기타"],
        .gyeongsang: ["경상도", "대구", "부산", "경상도 기타"],
        .jeolla: ["전라도", "광주", "전주", "전라도 기타"],
        .gangwon: ["강원도"],
        .jeju: ["제주도"]
    ]

    init(city: String) {
        for (region, cities) in RegionType.regionCities {
            if cities.contains(city) {
                self = region
                return
            }
        }
        self = .nationwide
    }
    
    var title: String {
        switch self {
        case .nationwide:
            return "전국"
        case .seoul:
            return "서울"
        case .gyeonggi:
            return "경기도"
        case .chungcheong:
            return "충청도"
        case .gyeongsang:
            return "경상도"
        case .jeolla:
            return "전라도"
        case .gangwon:
            return "강원도"
        case .jeju:
            return "제주도"
        }
    }
    
    var cities: [String] {
        RegionType.regionCities[self] ?? []
    }
}
