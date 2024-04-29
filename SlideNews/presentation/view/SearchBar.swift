//
//  SearchBar.swift
//  SlideNews
//
//  Created by Aman Kumar on 30/04/24.
//

import SwiftUI

struct SearchBar: View {
    @Binding var searchQuery: String
    let searchHint: String
    var onSearch: () -> Void
    
    var body: some View {
        HStack {
            RoundedRectangle(cornerRadius: 25)
                .fill(.grayPrimary)
                .frame(height: 50)
                .overlay {
                    TextField(searchHint, text: $searchQuery)
                        .font(.outfitFont(.regular, fontSize: .title3))
                        .submitLabel(.search)
                        .padding(.leading)
                }
            
            ZStack {
                Circle()
                    .fill(.grayPrimary)
                    .frame(width: 50)
                
                Button {
                    onSearch()
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
    }
}

#Preview {
    SearchBar(searchQuery: .constant(""), searchHint: "Search saved news", onSearch: {})
}
