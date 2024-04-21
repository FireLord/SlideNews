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
                        }
                    }
                }
                .padding(.horizontal)
            
                ZStack {
                    RoundedRectangle(cornerRadius: 30)
                        .fill(.primaryTwo)

                    VStack(alignment: .leading) {
                        Text("Demand for indian generic drugs skyrockets in...")
                            .font(.largeTitle)
                            .fontWeight(.medium)
                            .multilineTextAlignment(.leading)
                            .foregroundStyle(.black)
                            .padding(.horizontal)
                        
                        Text("Updated just now.")
                            .font(.subheadline)
                            .foregroundStyle(.black)
                            .opacity(0.6)
                            .padding(.top, 1)
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
                                    .font(.subheadline)
                                    .foregroundStyle(.black)
                                    .opacity(0.6)
                                    .padding(.top, 1)
                                
                                Text("Wade Warren")
                                    .font(.subheadline)
                                    .fontWeight(.medium)
                                    .foregroundStyle(.black)
                                    .padding(.top, 1)
                            }
                            
                            Spacer()
                            
                            Button {
                                print("hi")
                            } label: {
                                Text("Follow")
                                    .foregroundStyle(.white)
                                    .frame(width: 80, height: 40)
                                    .background {
                                        RoundedRectangle(cornerRadius: 30)
                                            .foregroundStyle(.black)
                                    }
                            }
                        }
                        .padding()
                        
                        Text("The demand for indian generic drugs has shot up in china and the massive COVID The demand for indian generic drugs has shot up in china and the")
                            .font(.title3)
                            .foregroundStyle(.black)
                            .padding(.horizontal)
                        
                        HStack {
                            Spacer()
                            
                            Button {
                                print("like")
                            } label: {
                                ActionButton(
                                    backgroundColor: .tertiaryTwo,
                                    iconName: "hand.thumbsup",
                                    iconColor: .secondaryTwo
                                )
                            }
                            
                            Button {
                                print("like")
                            } label: {
                                ActionButton(
                                    backgroundColor: .tertiaryTwo,
                                    iconName: "bookmark",
                                    iconColor: .secondaryTwo
                                )
                            }
                            
                            Button {
                                print("like")
                            } label: {
                                ActionButton(
                                    backgroundColor: .tertiaryTwo,
                                    iconName: "square.and.arrow.up",
                                    iconColor: .secondaryTwo
                                )
                            }
                        }
                        .padding(.horizontal)
                    }
                }
                .padding(.horizontal)
                .frame(height: 500)
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
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundStyle(.black)
                        .offset(x: 15)
                }
            
            Text("News")
                .font(.largeTitle)
                .fontWeight(.bold)
            
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
