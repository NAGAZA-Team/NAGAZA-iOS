//
//  MockDispatchQueueType.swift
//  Nagaza
//
//  Created by 전성훈 on 4/24/24.
//

import Foundation

@testable import Nagaza

class MockDispatchQueueType: DispatchQueueType {
    func async(execute work: @escaping () -> Void) {
        work()
    }
}
