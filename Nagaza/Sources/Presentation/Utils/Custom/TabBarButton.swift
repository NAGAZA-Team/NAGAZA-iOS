//
//  TabBarButton.swift
//  Nagaza
//
//  Created by 전성훈 on 2023/11/07.
//

import UIKit

final class TabBarButton: UIButton {
    private let selectedImageColor: UIColor = .orange
    private let normalImageColor: UIColor = .lightGray
    private let selectedTextColor: UIColor = .darkGray
    private let normalTextColor: UIColor = .lightGray
    
    override var isSelected: Bool {
        didSet {
            self.imageView?.tintColor = isSelected ? selectedImageColor : normalImageColor
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setAttribute()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    
    func setupButton(title: String, image: UIImage) {
        setTitle(title, for: .normal)
        setImage(image.withRenderingMode(.alwaysTemplate), for: .normal)
        
        alignImageAndTitleVertically(padding: 4)
    }
    
    private func setAttribute() {
        setTitleColor(normalTextColor, for: .normal)
        setTitleColor(selectedTextColor, for: .selected)
        
        imageView?.contentMode = .scaleAspectFit
        titleLabel?.textAlignment = .center
        titleLabel?.font = .systemFont(ofSize: 9, weight: .bold)
    }
    
    private func alignImageAndTitleVertically(padding: CGFloat) {
        guard let imageSize = self.imageView?.image?.size,
              let title = self.titleLabel?.text,
              let font = self.titleLabel?.font
        else { return }
            
        let titleSize = title.size(withAttributes: [NSAttributedString.Key.font: font])
        
        let totalHeight = imageSize.height + titleSize.height + padding
        
        let imageOffset = (totalHeight - imageSize.height) / 2 - (imageSize.height / 2)
        let titleOffset = (totalHeight - titleSize.height) / 2 - (titleSize.height / 2)
        
        imageEdgeInsets = UIEdgeInsets(
            top: -(imageOffset),
            left: 0,
            bottom: imageOffset,
            right: -titleSize.width
        )
        
        titleEdgeInsets = UIEdgeInsets(
            top: titleOffset,
            left: -imageSize.width,
            bottom: -(totalHeight + titleOffset),
            right: 0
        )
        
        let topInset = min(imageOffset, titleOffset)
        let bottomInset = totalHeight - topInset - titleSize.height
        
        contentEdgeInsets = UIEdgeInsets(
            top: topInset,
            left: 0,
            bottom: bottomInset,
            right: 0
        )
    }
}
