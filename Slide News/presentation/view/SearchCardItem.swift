//
//  SearchCardItem.swift
//  Slide News
//
//  Created by Aman Kumar on 26/04/24.
//

import SwiftUI

struct SearchCardItem: View {
    let article: Article
    let newsCardColor: NewsCardColor
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(newsCardColor.backgroundColor)
                
            HStack {
                // Post Image
                AsyncImage(url: URL(string: article.urlToImage ?? "")) { phase in
                    switch phase {
                    case .empty:
                        ProgressView() // Placeholder while loading
                        
                    case .success(let image):
                        image
                            .resizable()
                        
                    case .failure:
                        Image(systemName: "photo") // Placeholder for failure/error
                            .resizable()
                            .scaledToFit()
                        
                    default:
                        Image("photo") // Placeholder for failure/error
                            .resizable()
                            .scaledToFit()
                    }
                }
                .frame(width: 120, height: 100)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding(.leading)
                
                VStack {
                    Text(article.title)
                        .font(.outfitFont(.medium, fontSize: .title3))
                        .lineLimit(2)
                        .foregroundStyle(.black)
                    
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
                    .padding(.bottom, 4)
                    .padding(.horizontal)
                }
            }
            
        }
        .frame(height: 130)
        .padding(.horizontal)
    }
}

#Preview {
    SearchCardItem(article: Article.sampleArticle, newsCardColor: NewsCardColor.sampleColor)
}
