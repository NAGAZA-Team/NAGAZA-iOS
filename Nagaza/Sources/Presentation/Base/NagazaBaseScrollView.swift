//
//  NagazaBaseScrollView.swift
//  Nagaza
//
//  Created by 이승민 on 12/6/23.
//

import UIKit

class NagazaBaseScrollView: UIScrollView {
    init() {
        super.init(frame: .zero)
        self.contentInset = UIEdgeInsets(top: 0,
                                         left: 0,
                                         bottom: NagazaSize.tabBarHeight,
                                         right: 0)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
