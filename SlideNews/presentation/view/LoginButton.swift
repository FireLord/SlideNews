//
//  LoginButton.swift
//  Slide News
//
//  Created by Aman Kumar on 28/04/24.
//

import SwiftUI

struct LoginButton: View {
    let name: String
    let buttonColor: Color
    let textColor: Color
    
    var body: some View {
        HStack {
            Text(name)
                .font(.outfitFont(.medium, fontSize: .largeHeadline))
                .foregroundStyle(textColor)
            Image(systemName: "arrow.right")
        }
        .foregroundColor(.black)
        .frame(width: UIScreen.main.bounds.width - 32, height: 48)
        .background(.primaryTwo)
        .cornerRadius(10)
        .shadow(radius: 10)
    }
}

#Preview {
    LoginButton(name: "LOGIN", buttonColor: .primaryTwo, textColor: .black)
}
