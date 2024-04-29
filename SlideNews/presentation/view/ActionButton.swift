//
//  ActionButton.swift
//  Slide News
//
//  Created by Aman Kumar on 21/04/24.
//

import SwiftUI

struct ActionButton: View {
    let backgroundColor: Color
    let iconName: String
    let iconColor: Color
    
    var body: some View {
        Circle()
            .fill(backgroundColor)
            .frame(width: 35, height: 35)
            .overlay {
                Image(systemName: iconName)
                    .foregroundStyle(iconColor)
            }
    }
}

#Preview {
    ActionButton(backgroundColor: .tertiaryTwo, iconName: "bookmark", iconColor: .secondaryTwo)
}
