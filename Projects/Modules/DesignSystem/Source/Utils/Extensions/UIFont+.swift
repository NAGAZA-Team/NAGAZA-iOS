//
//  UIFont+.swift
//  Nagaza
//
//  Created by SeungMin on 2023/11/09.
//

import UIKit

fileprivate enum FontWeight: Int {
    case thin = 100
    case ultraLight = 200
    case light = 300
    case regular = 400
    case medium = 500
    case semibold = 600
    case bold = 700
    case heavy = 800
    case black = 900
}

public extension UIFont {
    
    static func pretendard(
        size fontSize: CGFloat,
        weight: UIFont.Weight
    ) -> UIFont {
        switch weight {
        case .thin:
            return DSKitFontFamily.Pretendard.thin.font(size: fontSize)
        case .ultraLight:
            return DSKitFontFamily.Pretendard.extraLight.font(size: fontSize)
        case .light:
            return DSKitFontFamily.Pretendard.light.font(size: fontSize)
        case .regular:
            return DSKitFontFamily.Pretendard.regular.font(size: fontSize)
        case .medium:
            return DSKitFontFamily.Pretendard.medium.font(size: fontSize)
        case .semibold:
            return DSKitFontFamily.Pretendard.semiBold.font(size: fontSize)
        case .bold:
            return DSKitFontFamily.Pretendard.bold.font(size: fontSize)
        case .heavy:
            return DSKitFontFamily.Pretendard.extraBold.font(size: fontSize)
        case .black:
            return DSKitFontFamily.Pretendard.black.font(size: fontSize)
        default:
            return DSKitFontFamily.Pretendard.regular.font(size: fontSize)
        }
    }
    
    static func pretendard(
        size fontSize: CGFloat,
        weight: Int
    ) -> UIFont {
        let weight = FontWeight(rawValue: weight)
        switch weight {
        case .thin:
            return DSKitFontFamily.Pretendard.thin.font(size: fontSize)
        case .ultraLight:
            return DSKitFontFamily.Pretendard.extraLight.font(size: fontSize)
        case .light:
            return DSKitFontFamily.Pretendard.light.font(size: fontSize)
        case .regular:
            return DSKitFontFamily.Pretendard.regular.font(size: fontSize)
        case .medium:
            return DSKitFontFamily.Pretendard.medium.font(size: fontSize)
        case .semibold:
            return DSKitFontFamily.Pretendard.semiBold.font(size: fontSize)
        case .bold:
            return DSKitFontFamily.Pretendard.bold.font(size: fontSize)
        case .heavy:
            return DSKitFontFamily.Pretendard.extraBold.font(size: fontSize)
        case .black:
            return DSKitFontFamily.Pretendard.black.font(size: fontSize)
        default:
            return DSKitFontFamily.Pretendard.regular.font(size: fontSize)
        }
    }
}
