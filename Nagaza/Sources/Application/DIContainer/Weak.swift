//
//  Weak.swift
//  Nagaza
//
//  Created by 전성훈 on 4/9/24.
//

import Foundation

struct Weak<T: AnyObject> {
    weak var value: T?
    
    init(value: T) {
        self.value = value
    }
}
