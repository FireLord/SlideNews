//
//  SwipeToGoBack.swift
//  Slide News
//  https://stackoverflow.com/a/77380861/8582220
//  Created by Aman Kumar on 28/04/24.
//

import SwiftUI

extension View {
    func swipeToGoBack() -> some View {
        self.modifier(SwipeToGoBackModifier())
    }
}

struct SwipeToGoBackModifier: ViewModifier {
    @Environment(\.presentationMode) var presentationMode
    
    func body(content: Content) -> some View {
        content
            .gesture(
                DragGesture(minimumDistance: 20, coordinateSpace: .global)
                    .onChanged { value in
                        print(value)
                        guard value.startLocation.x < 20, value.translation.width > 45 else { return }
                        self.presentationMode.wrappedValue.dismiss()
                        
                    }
            )
    }
}
