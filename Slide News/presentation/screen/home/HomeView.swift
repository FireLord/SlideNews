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
                HStack(spacing: 20) {
                    ForEach(0..<categoryList.count, id: \.self) { index in
                        Text(categoryList[index])
                            .font(.outfitFont(.regular, fontSize: index == categoryPosition ? .title : .title3))
                            .foregroundColor(index == categoryPosition ? .white : .gray)
                            .onTapGesture {
                                withAnimation {
                                    categoryPosition = index
                                }
                            }
                    }
                }
                .padding()
            
                ZStack {
                    NewsCard(article: Article.sampleArticle, newsCardColor: NewsCardColor(backgroundColor: .primaryOne, iconBackgroundColor: .tertiaryOne, iconColor: .secondaryOne))
                        .offset(x: 40, y: 20)
                        .rotationEffect(.degrees(10))
                    NewsCard(article: Article.sampleArticle, newsCardColor: NewsCardColor.sampleColor)
                }
                
                Spacer()
                
            }
        }
    }
}

#Preview {
    HomeView()
}

struct HeaderView: View {
    let columns: [GridItem] = [GridItem(spacing: 3),
                               GridItem(spacing: 3)]
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
                    .stroke()
                    .frame(width: 50, height: 50)
                    .foregroundStyle(.graySecondary)
                    .overlay {
                        LazyVGrid(columns: columns, spacing: 3) {
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
