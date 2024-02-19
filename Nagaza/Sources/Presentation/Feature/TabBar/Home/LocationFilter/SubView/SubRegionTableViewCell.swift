//
//  SubRegionTableViewCell.swift
//  Nagaza
//
//  Created by 전성훈 on 2024/02/20.
//

import UIKit

final class SubRegionTableViewCell: UITableViewCell {
    static let identifier = MainRegionTableViewCell.description()

    private lazy var regionLabel: UILabel = {
        let lbl = UILabel()
        
        return lbl
    }()
    
    private lazy var countLabel: UILabel = {
        let lbl = UILabel()
        
        return lbl
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func prepareForReuse() {
        
    }
    
    func bind() {
        updateInfo()
    }
    
    private func updateInfo() {
        
    }

}
