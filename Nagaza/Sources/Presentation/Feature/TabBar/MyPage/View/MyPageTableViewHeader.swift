//
//  MyPageTableViewHeader.swift
//  Nagaza
//
//  Created by 강조은 on 3/10/24.
//

import UIKit

final class MyPageTableViewHeader: UITableViewHeaderFooterView {
    
    static let identifier = MyPageTableViewHeader.description()
    
    private let background: UIView = {
        let view = UIView()
        
        view.backgroundColor = NagazaAsset.Colors.gray8.color
        
        return view
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        makeUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func makeUI() {
        addSubview(background)
        
        background.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
