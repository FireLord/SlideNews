//
//  SearchView.swift
//  Slide News
//
//  Created by Aman Kumar on 21/04/24.
//

import SwiftUI

struct SearchView: View {
    @State var searchQuery: String = ""
    
    var body: some View {
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
            
            // Search Card
            
            
            Spacer()
        }
    }
}

#Preview {
    SearchView()
}
