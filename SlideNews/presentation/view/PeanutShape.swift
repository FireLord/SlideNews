//
//  PeanutShape.swift
//  Slide News
//
//  Created by Aman Kumar on 28/04/24.
//

import SwiftUI

struct PeanutShape: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            let height = rect.height
            let width = rect.width
            let midWidth = width / 2
            let midHeight = height / 2
            let radius: CGFloat = 35
            
            // First semi-circle
            path.addArc(
                center: CGPoint(x: 0, y: midHeight),
                radius: radius,
                startAngle: .degrees(90),
                endAngle: .degrees(-90),
                clockwise: false)
            
            // Move pointer little inside
            path.move(to: CGPoint(x: -5, y: midHeight - radius))
            
            // wave 1 down curve
            path.addCurve(
                to: CGPoint(x: midWidth - radius, y: midHeight - (radius/2) - 10),
                control1: CGPoint(x: midWidth - radius - 20, y: midHeight - radius),
                control2: CGPoint(x: midWidth - radius - 20, y: midHeight - (radius/2) - 10)
            )
            
            path.addCurve(
                to: CGPoint(x: midWidth, y: midHeight - radius),
                control1: CGPoint(x: midWidth - radius + 20, y: midHeight - (radius/2) - 10),
                control2: CGPoint(x: midWidth - radius + 20, y: midHeight - radius)
            )
            
            // wave 1 up curve
            path.addCurve(
                to: CGPoint(x: midWidth + radius, y: midHeight - (radius/2) - 10),
                control1: CGPoint(x: midWidth + radius - 20, y: midHeight - radius),
                control2: CGPoint(x: midWidth + radius - 20, y: midHeight - (radius/2) - 10)
            )
            
            path.addCurve(
                to: CGPoint(x: width + 5, y: midHeight - radius),
                control1: CGPoint(x: midWidth + radius + 20, y: midHeight - (radius/2) - 10),
                control2: CGPoint(x: midWidth + radius + 20, y: midHeight - radius)
            )
            
            
            // Second semi-circle
            path.addArc(
                center: CGPoint(x: width, y: midHeight),
                radius: radius,
                startAngle: .degrees(-90),
                endAngle: .degrees(90),
                clockwise: false)
            
            path.addLine(to: CGPoint(x: 0, y: midHeight + radius)) // to fill the space
            
            // Move pointer little inside
            path.move(to: CGPoint(x: width + 5, y: midHeight + radius))
            
            // wave 2 up curve
            path.addCurve(
                to: CGPoint(x: midWidth + radius, y: midHeight + (radius/2) + 10),
                control1: CGPoint(x: midWidth + radius + 20, y: midHeight + radius),
                control2: CGPoint(x: midWidth + radius + 20, y: midHeight + (radius/2) + 10)
            )
            
            path.addCurve(
                to: CGPoint(x: midWidth, y: midHeight + radius),
                control1: CGPoint(x: midWidth + radius - 20, y: midHeight + (radius/2) + 10),
                control2: CGPoint(x: midWidth + radius - 20, y: midHeight + radius)
            )
            
            // wave 2 down curve
            path.addCurve(
                to: CGPoint(x: midWidth - radius, y: midHeight + (radius/2) + 10),
                control1: CGPoint(x: midWidth - radius + 20, y: midHeight + radius),
                control2: CGPoint(x: midWidth - radius + 20, y: midHeight + (radius/2) + 10)
            )
            
            path.addCurve(
                to: CGPoint(x: -5, y: midHeight + radius),
                control1: CGPoint(x: midWidth - radius - 20, y: midHeight + (radius/2) + 10),
                control2: CGPoint(x: midWidth - radius - 20, y: midHeight + radius)
            )
        }
    }
}

#Preview {
    ZStack {
        PeanutShape()
//            .stroke(lineWidth: 1)
            .foregroundStyle(.white)
            .frame(width: 140)
            .padding()
    }
}
