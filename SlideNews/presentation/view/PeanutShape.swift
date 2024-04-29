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
            let radius: CGFloat = 40
            
            // First semi-circle
            path.addArc(
                center: CGPoint(x: 0, y: midHeight),
                radius: radius,
                startAngle: .degrees(70),
                endAngle: .degrees(-70),
                clockwise: false)
            
            // First longer curve
            path.addCurve(
                to: CGPoint(x: midWidth + 10, y: midHeight - radius),
                control1: CGPoint(x: midWidth - (radius - 20), y: midHeight - radius + 20),
                control2: CGPoint(x: midWidth - (radius - 20), y: midHeight - radius - 10)
            )
            
            // First smaller curve
            path.addCurve(
                to: CGPoint(x: width + 10, y: midHeight - radius + 2),
                control1: CGPoint(x: midWidth + (radius + 10), y: midHeight - radius + 20),
                control2: CGPoint(x: midWidth + (radius + 10), y: midHeight - radius - 10)
            )
            
            // Second semi-circle
            path.addArc(
                center: CGPoint(x: width, y: midHeight),
                radius: radius,
                startAngle: .degrees(-70),
                endAngle: .degrees(100),
                clockwise: false)

            // Second longer curve
            path.addCurve(
                to: CGPoint(x: midWidth - 10, y: midHeight + radius),
                control1: CGPoint(x: midWidth + (radius - 20), y: midHeight + radius - 20),
                control2: CGPoint(x: midWidth + (radius - 20), y: midHeight + radius + 10)
            )
            
            // Second smaller curve
            path.addCurve(
                to: CGPoint(x: -10, y: midHeight + radius - 2),
                control1: CGPoint(x: midWidth - (radius + 10), y: midHeight + radius - 20),
                control2: CGPoint(x: midWidth - (radius + 10), y: midHeight + radius + 10)
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
