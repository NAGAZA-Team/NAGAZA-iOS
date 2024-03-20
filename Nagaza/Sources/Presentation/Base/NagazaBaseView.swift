//
//  NagazaBaseView.swift
//  Nagaza
//
//  Created by SeungMin on 2023/11/01.
//

import UIKit

class NagazaBaseView: UIView {
    private var afterViewDidLoad = true

    override init(frame: CGRect) {
        super.init(frame: frame)
        makeUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if afterViewDidLoad {
            afterViewDidLoad.toggle()
            adjustLayoutAfterRendering()
        }
    }
    
    /// Set up constraints of view and add subviews
    func makeUI() { }
    
    /// Adjust layout after rendering
    func adjustLayoutAfterRendering() { }
}

