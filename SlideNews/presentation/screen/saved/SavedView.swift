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
    @State var offsetValue: CGFloat = 150
    
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
                
                // Saved news card
                ScrollView(showsIndicators: false) {
                    VStack {
                        ForEach(appViewModel.articleDbList) { article in
                            let index = appViewModel.articleDbList.firstIndex(where: { $0.id == article.id })
                            let colorIndex = index! % NewsCardColor.cardColorList.count
                            let color = NewsCardColor.cardColorList[colorIndex]
                            
                            NavigationLink {
                                DetailView(article: article, newsCardColor: color)
                            } label: {
                                NewsCard(
                                    article: article,
                                    newsCardColor: color,
                                    
                                    onSave: { article in
                                        Task {
                                            try await appViewModel.deleteSavedNews(article: article)
                                        }
                                    }
                                )
                                .visualEffect { content, geometryProxy in
                                    content
                                        .scaleEffect(scaleY(geometryProxy, scale: 0), anchor: .top)
                                        .rotationEffect(rotationY(geometryProxy, rotation: -2))
                                        .offset(y: minY(geometryProxy))
                                        .offset(y: excessMinY(geometryProxy, offset: 200))
                                }
                            }
                            .zIndex(appViewModel.articleDbList.zIndex(article))
                        }
                    }
                }
                .offset(y: offsetValue)
                .ignoresSafeArea()
                .onAppear {
                    Task {
                        try await appViewModel.getAllSavedNews()
                    }
                    
                    withAnimation {
                        offsetValue = 0
                    }
                }
            }
        }
    }
}

#Preview {
    SavedView().environmentObject(AppViewModel())
}
