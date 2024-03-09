//
//  MypageInfo.swift
//  Nagaza
//
//  Created by 강조은 on 3/10/24.
//

import Foundation

struct MypageInfo: Hashable {
    public static func == (lhs: MypageInfo, rhs: MypageInfo) -> Bool {
        lhs.identifier == rhs.identifier
    }
    
    let identifier = UUID()
    
    let title: String
    var count: Int? = nil
}
