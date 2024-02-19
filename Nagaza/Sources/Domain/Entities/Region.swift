//
//  Region.swift
//  Nagaza
//
//  Created by 전성훈 on 2024/02/19.
//

import Foundation

/// DTO에서 활용할 때 Int형으로 Code형식 또는 단순 String으로 할지 의논 필요
/// 노션 안건 7번 건의
enum Region: String {
    case nationwide = "전국"
    case seoul = "서울"
    case gyeonggi = "경기도"
    case chungcheong = "충청도"
    case busanUlsanGyeongnam = "경상도"
    case jeolla = "전라도"
    case gangwon = "강원도"
    case jeju = "제주도"
    
    enum Seoul: String {
        case gangnam = "강남"
        case kondae = "건대"
        case hongdae = "홍대"
        case sinchon = "신촌"
        case daehakro = "대학로"
        case gangbuk = "강북"
        case sillim = "신림"
        case others = "기타"
    }
    
    enum Gyenggi: String {
        case incheon = "인천"
        case bucheon = "부천"
        case ilsand = "일산"
        case suwon = "수원"
        case anyang = "안양"
        case others = "기타"
    }
    
    enum Chungcheong: String {
        case daejeon = "대전"
        case cheonan = "천안"
        case cheongju = "청주"
        case others = "기타"
    }
    
    enum Gyeongsang: String {
          case daegu = "대구"
          case busan = "부산"
          case others = "기타"
      }
    
    enum Jeolla: String {
        case gwangju = "광주"
        case jeonju = "전주"
        case others = "기타"
    }
    
    enum Gangwon: String {
        case gangwon = "강원"
    }
    
    enum Jeju: String {
        case jeju = "제주"
    }
    
    /// 단순 Log - 삭제 예정
    static func fullPath(main: Region, sub: String?) -> String {
        if let subRegin = sub {
            return "\(main.rawValue) -> \(subRegin)"
        } else {
            return main.rawValue
        }
    }
}

