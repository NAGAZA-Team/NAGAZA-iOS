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
    case busanUlsanGyeongnam
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
        case .busanUlsanGyeongnam:
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
        case .seoul:
            return ["강남", "건대", "홍대", "신촌", "대학로", "강북", "신림", "기타"]
        case .gyeonggi:
            return ["인천", "부천", "일산", "수원", "안양", "기타"]
        case .chungcheong:
            return ["대전", "천안", "청주", "기타"]
        case .busanUlsanGyeongnam:
            return ["대구", "부산", "기타"]
        case .jeolla:
            return ["광주", "전주", "기타"]
        case .gangwon:
            return ["강원"]
        case .jeju:
            return ["제주"]
        default:
            return []
        }
        
    }
    
//    enum Seoul: String {
//        case gangnam = "강남"
//        case kondae = "건대"
//        case hongdae = "홍대"
//        case sinchon = "신촌"
//        case daehakro = "대학로"
//        case gangbuk = "강북"
//        case sillim = "신림"
//        case others = "기타"
//    }
//    
//    enum Gyenggi: String {
//        case incheon = "인천"
//        case bucheon = "부천"
//        case ilsand = "일산"
//        case suwon = "수원"
//        case anyang = "안양"
//        case others = "기타"
//    }
//    
//    enum Chungcheong: String {
//        case daejeon = "대전"
//        case cheonan = "천안"
//        case cheongju = "청주"
//        case others = "기타"
//    }
//    
//    enum Gyeongsang: String {
//          case daegu = "대구"
//          case busan = "부산"
//          case others = "기타"
//      }
//    
//    enum Jeolla: String {
//        case gwangju = "광주"
//        case jeonju = "전주"
//        case others = "기타"
//    }
//    
//    enum Gangwon: String {
//        case gangwon = "강원"
//    }
//    
//    enum Jeju: String {
//        case jeju = "제주"
//    }
    
//    /// 단순 Log - 삭제 예정
//    static func fullPath(main: Region, sub: String?) -> String {
//        if let subRegin = sub {
//            return "\(main.rawValue) -> \(subRegin)"
//        } else {
//            return main.rawValue
//        }
//    }
}

