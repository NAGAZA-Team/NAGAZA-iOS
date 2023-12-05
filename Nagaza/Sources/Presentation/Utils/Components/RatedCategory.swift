//
//  RatedCategory.swift
//  Nagaza
//
//  Created by 전성훈 on 2023/12/01.
//

import Foundation

enum RatedCategory {
    case mud
    case soil
    case grass
    case flower
    case flowerGarden
    
    init(rated: Double) {
        switch rated {
        case ...2.0:
            self = .mud
        case 2.1...4.0:
            self = .soil
        case 4.1...6.0:
            self = .grass
        case 6.1...8.0:
            self = .flower
        default:
            self = .flowerGarden
        }
    }
}
