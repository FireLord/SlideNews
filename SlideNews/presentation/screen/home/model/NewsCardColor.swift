//
//  NewsCardColor.swift
//  Slide News
//
//  Created by Aman Kumar on 21/04/24.
//

import SwiftUI

struct NewsCardColor {
    let backgroundColor: Color
    let iconBackgroundColor: Color
    let iconColor: Color
    
    static let sampleColor = NewsCardColor(backgroundColor: .primaryTwo, iconBackgroundColor: .tertiaryTwo, iconColor: .secondaryTwo)
    static let cardColorList = [
        NewsCardColor(backgroundColor: .primaryOne, iconBackgroundColor: .tertiaryOne, iconColor: .secondaryOne), // MARK: Pink
        NewsCardColor(backgroundColor: .primaryTwo, iconBackgroundColor: .tertiaryTwo, iconColor: .secondaryTwo), // MARK: Yellow
        NewsCardColor(backgroundColor: .primaryThree, iconBackgroundColor: .tertiaryThree, iconColor: .secondaryThree) // MARK: Blue
    ]
}
