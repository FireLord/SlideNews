//
//  SearchView.swift
//  Slide News
//
//  Created by Aman Kumar on 21/04/24.
//

import SwiftUI

struct SearchView: View {
    @EnvironmentObject var appViewModel: AppViewModel
    @State var searchQuery: String = ""
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                // Title
                Text("Search News")
                    .font(.outfitFont(.medium, fontSize: .largeTitle))
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                    .padding(.top, 50)
                
                // Search
                SearchBar(
                    searchQuery: $searchQuery,
                    searchHint: "Search news",
                    onSearch: {
                        Task {
                            if !searchQuery.isEmpty {
                                await appViewModel.getSearchNews(searchQuery: searchQuery)
                            }
                        }
                    }
                )
                .padding(.horizontal)
                
                // Search Card
                ScrollView {
                    LazyVStack {
                        ForEach(0 ..< appViewModel.articleFetchList.count, id: \.self) { index in
                            let colorIndex = index % NewsCardColor.cardColorList.count
                            let color = NewsCardColor.cardColorList[colorIndex]
                            
                            NavigationLink {
                                DetailView(article: appViewModel.articleFetchList[index], newsCardColor: color)
                            } label: {
                                SearchCardItem(
                                    article: appViewModel.articleFetchList[index],
                                    newsCardColor: color
                                )
                                .scrollTransition(.animated) { content, phase in
                                    content
                                        .scaleEffect(phase.isIdentity ? 1 : 0.8)
                                }
                            }
                        }
                    }
                }
                .alert(item: $appViewModel.alertItem) { alertItem in
                    Alert(title: alertItem.title,
                          message: alertItem.message,
                          dismissButton: alertItem.dismissButton)
                }
                .padding(.top)
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    SearchView().environmentObject(AppViewModel())
}
