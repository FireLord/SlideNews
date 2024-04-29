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
                        
                    default:
                        Image(systemName: "photo") // Placeholder for failure/error
                            .resizable()
                    }
                }
                .frame(width: 120)
                .cornerRadius(10, corners: [.topLeft, .bottomLeft])
                
                Spacer()
                
                VStack(alignment: .leading) {
                    Text(article.title)
                        .font(.outfitFont(.medium, fontSize: .title3))
                        .lineLimit(3)
                        .multilineTextAlignment(.leading)
                        .truncationMode(.head)
                        .foregroundStyle(.black)
                        .padding(.top, 10)
                        .padding(.trailing)
                    
                    Spacer()
                    
                    HStack {
                        Text(article.author ?? "Unknown")
                            .font(.outfitFont(.light, fontSize: .body))
                            .foregroundStyle(.gray)
                        
                        Spacer()
                        
                        Text(convertDate(dateString: article.publishedAt))
                            .font(.outfitFont(.light, fontSize: .body))
                            .foregroundStyle(.gray)
                            .padding(.trailing)
                    }
                    .padding(.bottom, 10)
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
