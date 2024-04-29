//
//  DetailView.swift
//  Slide News
//
//  Created by Aman Kumar on 23/04/24.
//

import SwiftUI

struct DetailView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var appViewModel: AppViewModel
    let article: Article
    let newsCardColor: NewsCardColor
    
    var body: some View {
        ZStack {
            ZStack {
                RoundedRectangle(cornerRadius: 30)
                    .fill(newsCardColor.backgroundColor)
                    .shadow(radius: 10)

                ScrollView {
                    VStack(alignment: .leading) {
                        // Back Button
                        Button {
                            self.presentationMode.wrappedValue.dismiss()
                            appViewModel.isNavBarHidden.toggle()
                        } label: {
                            Image(systemName: "arrow.left")
                                .foregroundStyle(.black)
                                .scaleEffect(1.5)
                                .padding()
                                .background {
                                    Circle()
                                        .fill(.black)
                                        .opacity(0.1)
                                }
                                .padding(.top)
                                .padding(.horizontal)
                        }
                        .frame(alignment: .topLeading)
                        .padding(.top, 40)
                        
                        // Title
                        Text(article.title)
                            .font(.outfitFont(.medium, fontSize: .largeTitle))
                            .multilineTextAlignment(.leading)
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
                        Text(article.content ?? "No description")
                            .font(.outfitFont(.light, fontSize: .title3))
                            .foregroundStyle(.black)
                            .padding(.horizontal)
                        
                        // Post Image
                        AsyncImage(url: URL(string: article.urlToImage ?? "")) { phase in
                            switch phase {
                            case .empty:
                                ProgressView() // Placeholder while loading
                                
                            case .success(let image):
                                image
                                    .resizable()
                                    .scaledToFit()
                                
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
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .padding(.horizontal)
                    }
                    
                    VStack {
                        Spacer()
                        
                        HStack {
                            Spacer()
                            
                            Button {
                                print("like")
                            } label: {
                                ActionButton(
                                    backgroundColor: .black,
                                    iconName: "hand.thumbsup",
                                    iconColor: .white
                                )
                            }
                            
                            Button {
                                print("like")
                            } label: {
                                ActionButton(
                                    backgroundColor: .black,
                                    iconName: "bookmark",
                                    iconColor: .white
                                )
                            }
                            
                            Button {
                                print("like")
                            } label: {
                                ActionButton(
                                    backgroundColor: .black,
                                    iconName: "square.and.arrow.up",
                                    iconColor: .white
                                )
                            }
                        }
                        .padding(.bottom, 40)
                        .padding(.horizontal, 30)
                    }
                }
            }
            .ignoresSafeArea()
            .navigationBarBackButtonHidden()
            .onAppear {
                appViewModel.isNavBarHidden.toggle()
            }
        }
        
    }
}

#Preview {
    DetailView(article: Article.sampleArticle, newsCardColor: NewsCardColor.sampleColor).environmentObject(AppViewModel())
}
