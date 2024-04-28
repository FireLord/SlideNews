//
//  GoogleButton.swift
//  Slide News
//
//  Created by Aman Kumar on 28/04/24.
//

import SwiftUI

struct GoogleButton: View {
    let buttonColor: Color
    let textColor: Color
    
    var body: some View {
        HStack {
            Text("G")
                .font(.outfitFont(.light, fontSize: .title))
                .foregroundStyle(textColor)
            
            Text("Continue with Google")
                .font(.outfitFont(.medium, fontSize: .largeHeadline))
                .foregroundStyle(textColor)
        }
        .foregroundColor(.black)
        .frame(width: UIScreen.main.bounds.width - 32, height: 48)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .stroke(lineWidth: 2)
                .foregroundStyle(buttonColor)
        )
        .cornerRadius(10)
        .shadow(radius: 10)
    }
}

#Preview {
    GoogleButton(buttonColor: .primaryTwo, textColor: .primaryTwo)
}
