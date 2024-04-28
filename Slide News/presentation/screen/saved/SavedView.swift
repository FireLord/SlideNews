//
//  SavedView.swift
//  Slide News
//
//  Created by Aman Kumar on 21/04/24.
//

import SwiftUI
import SwiftData

struct SavedView: View {
    @EnvironmentObject var appViewModel: AppViewModel
    @Environment(\.modelContext) var context
    @State var searchQuery: String = ""
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                // Title
                Text("Saved News")
                    .font(.outfitFont(.medium, fontSize: .largeTitle))
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                
                // Search
                HStack {
                    RoundedRectangle(cornerRadius: 25)
                        .fill(.grayPrimary)
                        .frame(height: 50)
                        .overlay {
                            TextField("Search saved news", text: $searchQuery)
                                .font(.outfitFont(.regular, fontSize: .title3))
                                .submitLabel(.search)
                                .padding(.leading)
                        }
                    
                    ZStack {
                        Circle()
                            .fill(.grayPrimary)
                            .frame(width: 50)
                        
                        Button {
                            print("hi")
                        } label: {
                            Circle()
                                .fill(.graySecondary)
                                .frame(width: 40)
                                .shadow(radius: 10)
                                .overlay {
                                    Image(systemName: "magnifyingglass")
                                        .scaleEffect(1.2)
                                        .foregroundStyle(.white)
                                }
                        }
                    }
                }
                .padding(.horizontal)
                
                // Saved news card
                ZStack {
                    ForEach(0 ..< appViewModel.articleDbList.count, id: \.self) { index in
                        let colorIndex = index % NewsCardColor.cardColorList.count
                        let color = NewsCardColor.cardColorList[colorIndex]
                        NavigationLink {
                            DetailView(article: appViewModel.articleDbList[index], newsCardColor: color)
                        } label: {
                            NewsCard(
                                article: appViewModel.articleDbList[index],
                                newsCardColor: color,
                                x: CGFloat(index * -15),
                                y: CGFloat(index * 200),
                                degree: CGFloat(index * -5),
                                onSwipeOut: {
                                    print("hi")
                                },
                                onSave: { article in
                                    Task {
                                        try await appViewModel.deleteSavedNews(article: article)
                                    }
                                }
                            )
                        }
                    }
                }
                .onAppear {
                    Task {
                        try await appViewModel.getAllSavedNews()
                    }
                }
                Spacer()
            }
        }
    }
}

#Preview {
    SavedView().environmentObject(AppViewModel())
}
