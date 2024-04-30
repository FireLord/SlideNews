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
                
                Spacer()
                
                HStack {
                    Spacer()
                    ActionButton(
                        backgroundColor: newsCardColor.iconBackgroundColor,
                        iconColor: newsCardColor.iconColor,
                        size: 35, 
                        articleLink: article.url,
                        onLikeClick: {},
                        onSaveClick: { onSave(article) }
                    )
                }
                .padding(.bottom)
                .padding(.horizontal)
            }
        }
        .frame(height: 550)
        .padding(.horizontal)
    }
}

#Preview {
    NewsCard(article: Article.sampleArticle, newsCardColor: NewsCardColor.sampleColor, onSave: {_ in })
}
