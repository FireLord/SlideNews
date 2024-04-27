//
//  NewsCard.swift
//  Slide News
//
//  Created by Aman Kumar on 21/04/24.
//

import SwiftUI

struct NewsCard: View {
    let article: Article
    let newsCardColor: NewsCardColor
    @State var x: CGFloat = 0.0
    @State var y: CGFloat = 0.0
    @State var degree: Double = 0.0
    var onSwipeOut: () -> Void
    var onSave: (Article) -> Void
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 30)
                .fill(newsCardColor.backgroundColor)
                .shadow(radius: 10)

            VStack(alignment: .leading) {
                // Title
                Text(article.title)
                    .font(.outfitFont(.medium, fontSize: .largeTitle))
                    .multilineTextAlignment(.leading)
                    .lineLimit(3)
                    .foregroundStyle(.black)
                    .padding()
                
                Text("Updated just now.")
                    .font(.outfitFont(.regular, fontSize: .subHeadline))
                    .foregroundStyle(.black)
                    .opacity(0.6)
                    .padding(.horizontal)
                
                HStack {
                    Circle()
                        .fill(.pink)
                        .opacity(0.5)
                        .frame(width: 50, height: 50)
                        .overlay {
                            Text("👨🏻‍💻")
                        }
                    
                    VStack(alignment: .leading, spacing: 0) {
                        Text("Published by")
                            .font(.outfitFont(.regular, fontSize: .subHeadline))
                            .foregroundStyle(.black)
                            .opacity(0.6)
                            .padding(.top, 1)
                        
                        // Author name
                        Text(article.author ?? "No Author")
                            .font(.outfitFont(.medium, fontSize: .subHeadline))
                            .foregroundStyle(.black)
                            .padding(.top, 1)
                    }
                    
                    Spacer()
                    
                    Button {
                        // Open Article Url
                        print("hi")
                    } label: {
                        Text("Follow")
                            .font(.outfitFont(.regular, fontSize: .title3))
                            .foregroundStyle(.white)
                            .frame(width: 80, height: 40)
                            .background {
                                RoundedRectangle(cornerRadius: 30)
                                    .foregroundStyle(.black)
                            }
                    }
                }
                .padding()
                
                // Short description
                Text(article.description ?? "No description")
                    .font(.outfitFont(.light, fontSize: .title3))
                    .multilineTextAlignment(.leading)
                    .foregroundStyle(.black)
                    .padding(.horizontal)
                    .padding(.bottom)
                
                HStack {
                    Spacer()
                    
                    Button {
                        print("like")
                    } label: {
                        ActionButton(
                            backgroundColor: newsCardColor.iconBackgroundColor,
                            iconName: "hand.thumbsup",
                            iconColor: newsCardColor.iconColor
                        )
                    }
                    
                    Button {
                        onSave(article)
                    } label: {
                        ActionButton(
                            backgroundColor: newsCardColor.iconBackgroundColor,
                            iconName: "bookmark",
                            iconColor: newsCardColor.iconColor
                        )
                    }
                    
                    Button {
                        print("like")
                    } label: {
                        ActionButton(
                            backgroundColor: newsCardColor.iconBackgroundColor,
                            iconName: "square.and.arrow.up",
                            iconColor: newsCardColor.iconColor
                        )
                    }
                }
                .padding(.bottom, 4)
                .padding(.horizontal)
            }
        }
        .padding(.horizontal)
        .frame(height: 540)
        .offset(x: x, y: y)
        .rotationEffect(.init(degrees: degree))
        .gesture(
            DragGesture()
                .onChanged { value in
                    withAnimation(.default) {
                        // Check if the swipe is towards the left
                        if value.translation.width < 0 {
                            x = value.translation.width
                            y = value.translation.height
                            degree = 7 * (value.translation.width > 0 ? 1 : -1)
                        }
                    }
                }
                .onEnded { value in
                    withAnimation(.interpolatingSpring(mass: 1.0, stiffness: 50, damping: 8, initialVelocity: 0)) {
                        // Check if the swipe is towards the left
                        if value.translation.width < -100 {
                            x = -500
                            degree = -12
                            onSwipeOut()
                        } else {
                            x = 0
                            y = 0
                            degree = 0
                        }
                    }
                }
        )
    }
}

#Preview {
    NewsCard(article: Article.sampleArticle, newsCardColor: NewsCardColor.sampleColor, onSwipeOut: {}, onSave: {_ in })
}
