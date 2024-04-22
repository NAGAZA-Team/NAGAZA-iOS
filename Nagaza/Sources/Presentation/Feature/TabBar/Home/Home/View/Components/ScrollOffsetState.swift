//
//  ScrollOffsetState.swift
//  Nagaza
//
//  Created by 전성훈 on 4/22/24.
//

import Foundation

enum ScrollOffsetState {
    case top(value: Double)
    case bottom
    
    init(rawValue: Double) {
        switch rawValue {
        case -CGFloat.greatestFiniteMagnitude..<CGFloat.windowFrameheight / 3:
            self = .top(value: rawValue)
        default:
            self = .bottom
        }
    }
    
    var alpha: Double {
        switch self {
        case .top(let value):
            return value / (CGFloat.windowFrameheight / 3)
        default:
            return 1
        }
    }
}
