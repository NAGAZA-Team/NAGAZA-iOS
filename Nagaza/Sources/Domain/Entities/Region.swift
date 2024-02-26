//
//  Region.swift
//  Nagaza
//
//  Created by 전성훈 on 2024/02/19.
//

import Foundation

/// DTO에서 활용할 때 Int형으로 Code형식 또는 단순 String으로 할지 의논 필요
/// 노션 안건 7번 건의
enum Region: Int {
    case nationwide
    case seoul
    case gyeonggi
    case chungcheong
    case gyeongsang
    case jeolla
    case gangwon
    case jeju
    
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
        switch self {
        case .nationwide:
            return ["전국 전체"]
        case .seoul:
            return ["서울 전체", "강남", "건대", "홍대", "신촌", "대학로", "강북", "신림", "기타"]
        case .gyeonggi:
            return ["경기도 전체", "인천", "부천", "일산", "수원", "안양", "기타"]
        case .chungcheong:
            return ["충남 전체", "대전", "천안", "청주", "기타"]
        case .gyeongsang:
            return ["경상도 전체", "대구", "부산", "기타"]
        case .jeolla:
            return ["전라도 전체", "광주", "전주", "기타"]
        case .gangwon:
            return ["강원 전체"]
        case .jeju:
            return ["제주 전체"]
        }
    }
}
