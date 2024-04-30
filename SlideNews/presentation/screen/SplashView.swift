//
//  SplashView.swift
//  SlideNews
//
//  Created by Aman Kumar on 30/04/24.
//

import SwiftUI

struct SplashView: View {
    @State var isActive: Bool = false
    
    var body: some View {
        ZStack {
            if isActive {
                if UserDefaults.standard.bool(forKey: "homeOpen") {
                    MainTabView()
                } else {
                    LoginView()
                }
            } else {
                Color.primaryTwo
                    .ignoresSafeArea()
                VStack(alignment: .center,spacing: 0) {
                    Image("SlideNewsLogo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 400, height: 400)
                    
                    Text("Slide News")
                        .foregroundStyle(.black)
                        .font(.outfitFont(.medium, fontSize: .heading))
                        .offset(y: -50)
                }
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                withAnimation {
                    self.isActive = true
                }
            }
        }
    }
}

#Preview {
    SplashView()
}
