//
//  NagazaTableViewCell.swift
//  Nagaza
//
//  Created by SeungMin on 3/27/24.
//

import UIKit
import RxSwift

class NagazaTableViewCell: UITableViewCell {
    var disposeBag = DisposeBag()
    
    override init(
        style: UITableViewCell.CellStyle,
        reuseIdentifier: String?
    ) {
        super.init(
            style: style,
            reuseIdentifier: reuseIdentifier
        )
//        self.selectionStyle = .none
        
        makeUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        self.disposeBag = DisposeBag()
        super.prepareForReuse()
    }
    
    func makeUI() { }
}
