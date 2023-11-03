//
//  NagazaBaseView.swift
//  Nagaza
//
//  Created by SeungMin on 2023/11/01.
//

import UIKit

class NagazaBaseView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        makeUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// Set up configuration of view and add subviews
    func makeUI() { }
}

