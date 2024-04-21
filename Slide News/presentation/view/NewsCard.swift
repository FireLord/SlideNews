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
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 30)
                .fill(newsCardColor.backgroundColor)
                .shadow(radius: 10)

            VStack(alignment: .leading) {
                // Title
                Text(article.title)
                    .font(.largeTitle)
                    .fontWeight(.medium)
                    .multilineTextAlignment(.leading)
                    .lineLimit(3)
                    .foregroundStyle(.black)
                    .padding()
                
                Text("Updated just now.")
                    .font(.subheadline)
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
                            .font(.subheadline)
                            .foregroundStyle(.black)
                            .opacity(0.6)
                            .padding(.top, 1)
                        
                        // Author name
                        Text(article.author ?? "No Author")
                            .font(.subheadline)
                            .fontWeight(.medium)
                            .foregroundStyle(.black)
                            .padding(.top, 1)
                    }
                    
                    Spacer()
                    
                    Button {
                        // Open Article Url
                        print("hi")
                    } label: {
                        Text("Follow")
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
                    .font(.title3)
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
                        print("like")
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
                .padding(.horizontal)
            }
        }
        .padding(.horizontal)
        .frame(height: 500)
    }
}

#Preview {
    NewsCard(article: Article.sampleArticle, newsCardColor: NewsCardColor.sampleColor)
}
