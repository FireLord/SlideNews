//
//  HomeView.swift
//  Slide News
//
//  Created by Aman Kumar on 21/04/24.
//

import SwiftUI

struct HomeView: View {
    @State var categoryPosition = 0
    let categoryList = ["Trending", "Health", "Sports", "Finance"]
    
    var body: some View {
        NavigationStack {
            VStack {
                // News app title and button
                HeaderView()
                    .padding(.horizontal)
                
                // Scroll List of category
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack {
                        ForEach(categoryList, id: \.self) { category in
                            Text(category)
                                .font(.title)
                        }
                    }
                }
                .padding(.horizontal)
            
                ZStack {
                    NewsCard(article: Article.sampleArticle, newsCardColor: NewsCardColor(backgroundColor: .primaryOne, iconBackgroundColor: .tertiaryOne, iconColor: .secondaryOne))
                        .offset(x: 40, y: 20)
                        .rotationEffect(.degrees(10))
                    NewsCard(article: Article.sampleArticle, newsCardColor: NewsCardColor.sampleColor)
                }
                
            }
        }
    }
}

#Preview {
    HomeView()
}

struct HeaderView: View {
    let columns: [GridItem] = [GridItem(.flexible()),
                               GridItem(.flexible())]
    var body: some View {
        HStack {
            Circle()
                .frame(width: 50, height: 50)
                .overlay {
                    Text("Z")
                        .font(.outfitFont(.black, fontSize: .largeTitle))
                        .foregroundStyle(.black)
                        .offset(x: 15)
                }
            
            Text("News")
                .font(.outfitFont(.bold, fontSize: .largeTitle))
            
            Spacer()
            
            Button {
                print("hi")
            } label: {
                Circle()
                    .stroke(lineWidth: 0.2)
                    .frame(width: 50, height: 50)
                    .overlay {
                        LazyVGrid(columns: columns, spacing: 5) {
                            ForEach(0...3, id: \.self) { _ in
                                Circle()
                                    .stroke(lineWidth: 2)
                                    .frame(width: 10, height: 10)
                            }
                        }
                        .padding()
                    }
                    .foregroundStyle(.white)
            }
        }
    }
}
