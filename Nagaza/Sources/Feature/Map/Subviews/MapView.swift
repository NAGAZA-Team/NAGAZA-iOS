//
//  MapView.swift
//  Nagaza
//
//  Created by SeungMin on 2023/10/19.
//

import UIKit
import SnapKit

final class MapView: UIView {
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.backgroundColor = .orange
        return stackView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "우아아아아"
        return label
    }()
    
    let subLabel: UILabel = {
        let label = UILabel()
        label.text = "우아아아아"
        return label
    }()
    
    init() {
        super.init(frame: .zero)
        setup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(stackView)
        stackView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
        
        stackView.addArrangedSubviews([
            titleLabel, subLabel
        ])
    }
}

#if DEBUG
import SwiftUI

struct CarouselViewPreview: PreviewProvider {
    static var previews: some View {
        MapView()
            .toPreView()
            .frame(width: 0,
                   height: 200)
    }
}
#endif
