//
//  MyPageInfo.swift
//  Nagaza
//
//  Created by 강조은 on 3/10/24.
//

import Foundation
import RxDataSources

typealias MySection = SectionModel<MyPageSectionType, MyPageInfo>

struct MyPageInfo: Hashable {
    let type: MyPageRowType
    var count: Int? = nil
}
