//
//  WaveUnderline.swift
//  Slide News
//
//  Created by Aman Kumar on 28/04/24.
//

import SwiftUI

struct WaveUnderline: View {
    var body: some View {
        GeometryReader { proxy in
            Path { path in
                let width = proxy.size.width
                let height = proxy.size.height
                
                path.move(to: CGPoint(x: 0, y: height))
                
                var isUpwards = true
                var xPosition: CGFloat = 0
                
                while xPosition < width {
                    path.addLine(to: CGPoint(x: xPosition + 5, y: isUpwards ? height - 5 : height))
                    path.addLine(to: CGPoint(x: xPosition + 10, y: isUpwards ? height : height - 5))
                    xPosition += 10
                    isUpwards.toggle()
                }
            }
            .stroke(Color.black, lineWidth: 2)
        }
    }
}

#Preview {
    WaveUnderline()
}
