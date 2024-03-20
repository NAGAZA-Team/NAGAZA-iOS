//
//  NagazaCollectionViewCell.swift
//  Nagaza
//
//  Created by SeungMin on 3/14/24.
//

import UIKit
import RxSwift

class NagazaCollectionViewCell: UICollectionViewCell {
    var disposeBag = DisposeBag()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
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
