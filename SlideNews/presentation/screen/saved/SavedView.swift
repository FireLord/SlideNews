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
                SearchBar(
                    searchQuery: $searchQuery,
                    searchHint: "Search saved news",
                    onSearch: {}
                )
                .padding(.horizontal)
                
                // Saved news card
//                ZStack {
//                    ForEach(0 ..< appViewModel.articleDbList.count, id: \.self) { index in
//                        let colorIndex = index % NewsCardColor.cardColorList.count
//                        let color = NewsCardColor.cardColorList[colorIndex]
//                        NavigationLink {
//                            DetailView(article: appViewModel.articleDbList[index], newsCardColor: color)
//                        } label: {
//                            NewsCard(
//                                article: appViewModel.articleDbList[index],
//                                newsCardColor: color,
//                                x: CGFloat(index * -15),
//                                y: CGFloat(index * 200),
//                                degree: CGFloat(index * -5),
//                                onSwipeOut: {
//                                    print("hi")
//                                },
//                                onSave: { article in
//                                    Task {
//                                        try await appViewModel.deleteSavedNews(article: article)
//                                    }
//                                }
//                            )
//                        }
//                    }
//                }
//                .onAppear {
//                    Task {
//                        try await appViewModel.getAllSavedNews()
//                    }
//                }
                
                ScrollView(showsIndicators: false) {
                    VStack {
                        ForEach(0 ..< appViewModel.articleDbList.count, id: \.self) { index in
                            let colorIndex = index % NewsCardColor.cardColorList.count
                            let color = NewsCardColor.cardColorList[colorIndex]
                            NavigationLink {
                                DetailView(article: appViewModel.articleDbList[index], newsCardColor: color)
                            } label: {
                                NewsCard(
                                    article: appViewModel.articleDbList[index],
                                    newsCardColor: color,
                                    
                                    onSave: { article in
                                        Task {
                                            try await appViewModel.deleteSavedNews(article: article)
                                        }
                                    }
                                )
                                .scrollTransition { content, phase in
                                    content
                                        .offset(
                                            x: phase.isIdentity ? 0 : 15,
                                            y: phase.isIdentity ? 0 : -300
                                        )
                                        .rotationEffect(.degrees(phase.isIdentity ? 0 : -5))
                                }
                            }
                        }
                    }
                }
                .ignoresSafeArea()
                .onAppear {
                    Task {
                        try await appViewModel.getAllSavedNews()
                    }
                }
            }
        }
    }
}

#Preview {
    SavedView().environmentObject(AppViewModel())
}
