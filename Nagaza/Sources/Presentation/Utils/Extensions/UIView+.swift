//
//  UIView+.swift
//  Nagaza
//
//  Created by SeungMin on 2023/10/19.
//

import UIKit

extension UIView {
    func addSubviews(_ views: [UIView]) {
        views.forEach { self.addSubview($0) }
    }
}

