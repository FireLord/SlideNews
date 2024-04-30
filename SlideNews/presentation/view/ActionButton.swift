//
//  ActionButton.swift
//  Slide News
//
//  Created by Aman Kumar on 21/04/24.
//

import SwiftUI

struct ActionButton: View {
    let backgroundColor: Color
    let iconColor: Color
    let size: CGFloat
    let articleLink: String
    var onLikeClick: () -> Void
    var onSaveClick: () -> Void
    
    var body: some View {
        HStack {
            Spacer()
            
            Button {
                onLikeClick()
            } label: {
                Circle()
                    .fill(backgroundColor)
                    .frame(width: size, height: size)
                    .overlay {
                        Image(systemName: "hand.thumbsup")
                            .foregroundStyle(iconColor)
                    }
            }
            
            Button {
                onSaveClick()
            } label: {
                Circle()
                    .fill(backgroundColor)
                    .frame(width: size, height: size)
                    .overlay {
                        Image(systemName: "bookmark")
                            .foregroundStyle(iconColor)
                    }
            }
            
            ShareLink(item: URL(string: articleLink)!) {
                Circle()
                    .fill(backgroundColor)
                    .frame(width: size, height: size)
                    .overlay {
                        Image(systemName: "square.and.arrow.up")
                            .foregroundStyle(iconColor)
                    }
            }
        }
    }
}

#Preview {
    ActionButton(backgroundColor: .tertiaryTwo, iconColor: .secondaryTwo, size: 35, articleLink: "https://indianexpress.com/article/lifestyle/food-wine/nutrition-alert-heres-what-a-100-gram-serving-of-persimmon-contains-9266141/", onLikeClick: {}, onSaveClick: {})
}
