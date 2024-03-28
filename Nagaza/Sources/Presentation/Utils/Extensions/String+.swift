//
//  String+.swift
//  Nagaza
//
//  Created by 강조은 on 2/25/24.
//

import UIKit

extension String {
    // 폰트 참조하여 1줄 너비값 구하기
    func widthOfFont(usingFont font: UIFont) -> CGFloat {
        let fontAttributes = [NSAttributedString.Key.font: font]
        let size = self.size(withAttributes: fontAttributes)
        return size.width
    }
    // 폰트 참조하여 1줄 높이값 구하기
    func heightOfFont(usingFont font: UIFont) -> CGFloat {
        let fontAttributes = [NSAttributedString.Key.font: font]
        let size = self.size(withAttributes: fontAttributes)
        return size.height
    }
    
    func toAttributedString(
        with keyword: String?,
        font: UIFont,
        color: UIColor
    ) -> NSAttributedString? {
        guard let keyword = keyword else { return NSAttributedString(string: self) }
        
        let attributeString = NSMutableAttributedString(string: self)
        attributeString.addAttributes(
            [
                .foregroundColor: color,
                .font: font
            ],
            range: (self as NSString).range(of:  keyword)
        )
        
        return attributeString
    }
}
