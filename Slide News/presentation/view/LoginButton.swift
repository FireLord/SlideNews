//
//  LoginButton.swift
//  Slide News
//
//  Created by Aman Kumar on 28/04/24.
//

import SwiftUI

struct LoginButton: View {
    let name: String
    
    var body: some View {
        HStack {
            Text(name)
                .fontWeight(.semibold)
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
    LoginButton(name: "LOGIN IN")
}
