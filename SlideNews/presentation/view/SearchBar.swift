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
            TextField(searchHint, text: $searchQuery)
                .font(.outfitFont(.regular, fontSize: .title3))
                .submitLabel(.search)
                .padding(.leading)
                .onSubmit {
                    onSearch()
                }
            
            Spacer()
            
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
                    .padding(.trailing, 5)
            }
        }
        .background(
            SearchBarBackground()
                .fill(.grayPrimary)
                .padding(.horizontal)
                .frame(width: UIScreen.main.bounds.width - 50)
                
        )
        .padding(.horizontal)
    }
}

#Preview {
    SearchBar(searchQuery: .constant(""), searchHint: "Search saved news", onSearch: {})
}
