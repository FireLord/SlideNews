//
//  SearchBarBackground.swift
//  SlideNews
//
//  Created by Aman Kumar on 30/04/24.
//

import Foundation
import SwiftUI

struct SearchBarBackground: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            let height = rect.height
            let width = rect.width
            let midWidth = width / 2
            let midHeight = height / 2
            let radius: CGFloat = 25
            
            // First semi-circle
            path.addArc(
                center: CGPoint(x: 0, y: midHeight),
                radius: radius,
                startAngle: .degrees(90),
                endAngle: .degrees(-90),
                clockwise: false)
            
            path.addLine(to: CGPoint(x: width - 100, y: midHeight - radius))
            
            path.addCurve(
                to: CGPoint(x: midWidth + 100, y: midHeight - radius),
                control1: CGPoint(x: midWidth + 80, y: 60),
                control2: CGPoint(x: midWidth + 80, y: 60)
            )
        }
    }
}

#Preview {
    ZStack {
        SearchBarBackground()
            .stroke(lineWidth: 1)
            .frame(width: UIScreen.main.bounds.width - 100, height: 100)
            .foregroundStyle(.white)
    }
}
