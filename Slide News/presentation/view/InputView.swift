//
//  InputView.swift
//  Slide News
//
//  Created by Aman Kumar on 28/04/24.
//

import SwiftUI

struct InputView: View {
    @Binding var text: String
    let title: String
    let placeholder: String
    var isSecureField = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .font(.outfitFont(.regular, fontSize: .title3))
                .foregroundColor(Color(.white))
            
            if isSecureField {
                SecureField(placeholder, text: $text)
                    .font(.outfitFont(.regular, fontSize: .body))
                    .textContentType(.password)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .foregroundColor(Color(.primaryTwo))
            } else {
                TextField(placeholder, text: $text)
                    .font(.outfitFont(.regular, fontSize: .body))
                    .textContentType(.emailAddress)
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .foregroundColor(Color(.primaryTwo))
            }
            
            Divider()
        }
    }
}

#Preview {
    ZStack {
        Color.grayPrimary
        
        InputView(text: .constant(""), title: "Email Address", placeholder: "xyz@gmail.com")
    }
}
