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
    
    func makeGradient(colors: [UIColor]) {
        let layer: CAGradientLayer = CAGradientLayer()
        layer.frame = bounds
        layer.colors = colors.map { $0.cgColor }
        layer.startPoint = CGPoint(x: 0.5, y: 0.0)
        layer.endPoint = CGPoint(x: 0.5, y: 1.0)
        self.layer.addSublayer(layer)
    }
}
