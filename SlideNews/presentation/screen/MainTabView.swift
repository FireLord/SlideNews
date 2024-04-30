//
//  MainTabView.swift
//  Slide News
//
//  Created by Aman Kumar on 21/04/24.
//

import SwiftUI

struct MainTabView: View {
    @EnvironmentObject var appViewModel: AppViewModel
    @State var index = 0
    
    var body: some View {
        ZStack {
            switch(index) {
            case 0:
                HomeView()
            case 1:
                SearchView()
            case 2:
                SavedView()
            default:
                HomeView()
            }
            
            VStack {
                Spacer()
                
                HStack(spacing: 10) {
                    Button {
                        index = 0
                    } label: {
                        Circle()
                            .fill(index == 0 ? .white : .graySecondary)
                            .frame(width: 60, height: 60)
                            .overlay {
                                Image(systemName: index == 0 ? "triangle.fill" : "triangle")
                                    .scaleEffect(1.5)
                                    .foregroundStyle(index == 0 ? .black : .white)
                            }
                            .shadow(radius: 10)
                    }
                    
                    Button {
                        index = 1
                    } label: {
                        Circle()
                            .fill(index == 1 ? .white : .graySecondary)
                            .frame(width: 60, height: 60)
                            .overlay {
                                Image(systemName: "magnifyingglass")
                                    .scaleEffect(1.5)
                                    .foregroundStyle(index == 1 ? .black : .white)
                            }
                            .shadow(radius: 10)
                    }
                    
                    Button {
                        index = 2
                    } label: {
                        Circle()
                            .fill(index == 2 ? .white : .graySecondary)
                            .frame(width: 60, height: 60)
                            .overlay {
                                Image(systemName: index == 2 ? "bookmark.fill" : "bookmark")
                                    .scaleEffect(1.5)
                                    .foregroundStyle(index == 2 ? .black : .white)
                            }
                            .shadow(radius: 10)
                    }
                }
                .background(
                    PeanutShape()
                        .foregroundStyle(.grayPrimary)
                        .frame(width: 140)
                        .shadow(radius: 10)
                )
            }
            .opacity(appViewModel.isNavBarHidden ? 0 : 1)
        }
    }
}

#Preview {
    MainTabView().environmentObject(AppViewModel())
}
