//
//  HomeView.swift
//  Slide News
//
//  Created by Aman Kumar on 21/04/24.
//

import SwiftUI

struct HomeView: View {
    let columns: [GridItem] = [GridItem(.flexible()),
                               GridItem(.flexible())]
    
    var body: some View {
        NavigationStack {
            VStack {
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
                            .stroke(lineWidth: 0.5)
                            .frame(width: 50, height: 50)
                            .overlay {
                                LazyVGrid(columns: columns, spacing: 6) {
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
                .padding()
                
                Spacer()
            }
        }
    }
}

#Preview {
    HomeView()
}
