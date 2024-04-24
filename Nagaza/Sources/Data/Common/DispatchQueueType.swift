//
//  DispatchQueueType.swift
//  Nagaza
//
//  Created by 전성훈 on 4/24/24.
//

import Foundation

// 테스트 코드 작성을 위해

protocol DispatchQueueType {
    func async(execute work: @escaping () -> Void)
}

extension DispatchQueue: DispatchQueueType {
    func async(execute work: @escaping () -> Void) {
        async(group: nil, execute: work)
    }
}
