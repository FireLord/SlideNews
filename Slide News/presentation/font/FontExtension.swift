//
//  FontExtension.swift
//  Slide News
//
//  Created by Aman Kumar on 21/04/24.
//

import SwiftUI

enum OutfitText: String {
    case regular = "Outfit-Regular"
    case bold = "Outfit-Bold"
    case medium = "Outfit-Medium"
    case black = "Outfit-Black"
    case light = "Outfit-Light"
}

enum FontSize: CGFloat {
    case heading = 48
    case largeTitle = 34
    case title = 28
    case title2 = 22
    case title3 = 20
    case body = 14
    case subHeadline = 15
}

extension Font {
    static func outfitFont(_ font: OutfitText, fontSize: FontSize) -> Font {
        custom(font.rawValue, size: fontSize.rawValue)
    }
}
