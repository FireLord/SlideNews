//
//  SearchBarBackground.swift
//  SlideNews
//
//  Created by Aman Kumar on 30/04/24.
//

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
            
            path.addLine(to: CGPoint(x: width - (2 * radius) - 20, y: midHeight - radius))
            
            path.addCurve(
                to: CGPoint(x: width - (2 * radius) + 20, y: midHeight - 10),
                control1: CGPoint(x: width - (2 * radius) + 10, y: midHeight - radius),
                control2: CGPoint(x: width - (2 * radius) + 10, y: midHeight - 10)
            )
            
            path.addCurve(
                to: CGPoint(x: width, y: midHeight - radius),
                control1: CGPoint(x: width - 20, y: midHeight - 10),
                control2: CGPoint(x: width - 20, y: midHeight - radius)
            )
            
            path.addArc(
                center: CGPoint(x: width, y: midHeight),
                radius: radius,
                startAngle: .degrees(-90),
                endAngle: .degrees(90),
                clockwise: false)
            
            path.addCurve(
                to: CGPoint(x: width - (2 * radius) + 20, y: midHeight + 10),
                control1: CGPoint(x: width - 20, y: midHeight + radius),
                control2: CGPoint(x: width - 20, y: midHeight + 10)
            )
            
            path.addCurve(
                to: CGPoint(x: width - (2 * radius) - 10, y: midHeight + radius),
                control1: CGPoint(x: width - (2 * radius) + 10, y: midHeight + 10),
                control2: CGPoint(x: width - (2 * radius) + 10, y: midHeight + radius)
            )
            
            path.addLine(to: CGPoint(x: 0, y: midHeight + radius))
        }
    }
}

#Preview {
    ZStack {
        SearchBarBackground()
//            .stroke(lineWidth: 1)
            .frame(width: 300, height: 100)
            .foregroundStyle(.white)
    }
}
