//
//  NagazaBaseTableViewCell.swift
//  Nagaza
//
//  Created by 강조은 on 3/22/24.
//

import UIKit

class NagazaBaseTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        
        makeUI()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func makeUI() {}
    func setConstraints() {}
}
