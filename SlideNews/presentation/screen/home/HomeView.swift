//
//  HomeView.swift
//  Slide News
//
//  Created by Aman Kumar on 21/04/24.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var appViewModel: AppViewModel
    @State var categoryPosition = 0
    let categoryList = ["Trending", "Health", "Sports", "Business"]
    
    var body: some View {
        NavigationStack {
            VStack {
                // News app title and button
                HeaderView()
                    .padding(.horizontal)
                
                // Scroll List of category
                HStack(spacing: 18) {
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
                .padding(.horizontal)

                if appViewModel.isLoading {
                    ZStack {
                        ProgressView()
                            .scaleEffect(2)
                            .tint(.primaryTwo)
                        
                    }
                    Spacer()
                }
                
                ScrollView(.horizontal, showsIndicators: false) {
                    // MARK: BUG - some weird issuse when using HStack
                    LazyHStack {
                        ForEach(appViewModel.articleFetchList) { article in
                            let index = appViewModel.articleFetchList.firstIndex(where: { $0.id == article.id })
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
                                            try await appViewModel.saveNews(article: article)
                                        }
                                    }
                                )
                                .frame(width: UIScreen.main.bounds.width)
                                .visualEffect { content, geometryProxy in
                                    content
                                        .scaleEffect(scale(geometryProxy, scale: 0.01), anchor: .trailing)
                                        .rotationEffect(rotation(geometryProxy), anchor: .bottom)
                                        .offset(x: minX(geometryProxy))
                                        .offset(x: excessMinX(geometryProxy))
                                }
                                
                            }
                            .zIndex(appViewModel.articleFetchList.zIndex(article))
                        }
                    }
                }
                .offset(y: -40) // MARK: BUG - some weird issuse when using LazyHStack
                .scrollTargetBehavior(.paging)
                .ignoresSafeArea()
                .alert(item: $appViewModel.alertItem) { alertItem in
                    Alert(title: alertItem.title,
                          message: alertItem.message,
                          dismissButton: alertItem.dismissButton)
                }
                .task {
                    await appViewModel.getAllNews(category: categoryList[categoryPosition] == "Trending" ? "" : categoryList[categoryPosition])
                }
                .onChange(of: categoryPosition) { newValue in
                    Task {
                        appViewModel.articleFetchList = []
                        await appViewModel.getAllNews(category: categoryList[categoryPosition] == "Trending" ? "" : categoryList[categoryPosition])
                    }
                }
            }
            .onAppear {
                UserDefaults.standard.set(true, forKey: "homeOpen")
            }
        }
    }
}

#Preview {
    HomeView().environmentObject(AppViewModel()).environmentObject(LoginViewModel())
}

struct HeaderView: View {
    @EnvironmentObject var loginViewModel: LoginViewModel
    
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
                Task {
                    loginViewModel.signOut()
                }
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
