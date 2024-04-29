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
                startAngle: .degrees(90),
                endAngle: .degrees(-90),
                clockwise: false)
            
//            path.addLine(to: CGPoint(x: midWidth - 35, y: midHeight - 20))
//            path.addLine(to: CGPoint(x: midWidth, y: midHeight - radius))
            
//            path.addQuadCurve(
//                to: CGPoint(x: midWidth, y: midHeight - 35),
//                control: CGPoint(x: midWidth - 35, y: midHeight - 20)
//            )
//            
//            path.addQuadCurve(
//                to: CGPoint(x: midWidth + 70, y: midHeight - 35),
//                control: CGPoint(x: midWidth + 35, y: midHeight - 20)
//            )
            
//            path.addCurve(
//                to: CGPoint(x: midWidth - 35, y: midHeight - 25),
//                control1: CGPoint(x: midWidth - 50, y: midHeight - 35),
//                control2: CGPoint(x: midWidth - 50, y: midHeight)
//            )
            
            // Middle curve
//            path.addCurve(
//                to: CGPoint(x: midWidth + 30, y: midHeight - radius + 5),
//                control1: CGPoint(x: midWidth - 25, y: midHeight - radius + 15),
//                control2: CGPoint(x: midWidth - 25, y: midHeight - radius - 15)
//            )
            
//            path.addCurve(
//                to: CGPoint(x: midWidth, y: midHeight - radius),
//                control1: CGPoint(x: midWidth - (radius - 15), y: midHeight - radius + 10),
//                control2: CGPoint(x: midWidth - (radius - 15), y: midHeight - radius - 10)
//            )
            
//            path.addCurve(
//                to: CGPoint(x: width, y: midHeight - radius),
//                control1: CGPoint(x: midWidth + (radius - 15), y: midHeight - radius + 10),
//                control2: CGPoint(x: midWidth + (radius - 15), y: midHeight - radius - 10)
//            )
            
            
//            path.addCurve(
//                to: CGPoint(x: width, y: midHeight - radius),
//                control1: CGPoint(x: midWidth + 30, y: midHeight - radius + 10),
//                control2: CGPoint(x: midWidth + 30, y: midHeight - radius - 10)
//            )
            
            // Quad curve to complete the reset curve
            path.addQuadCurve(
                to: CGPoint(x: midWidth, y: midHeight - radius),
                control: CGPoint(x: midWidth - radius, y: midHeight - radius + 10)
            )
            
            path.addQuadCurve(
                to: CGPoint(x: width, y: midHeight - radius),
                control: CGPoint(x: midWidth + radius, y: midHeight - radius + 10)
            )
            
//            // Second semi-circle
            path.addArc(
                center: CGPoint(x: width, y: midHeight),
                radius: radius,
                startAngle: .degrees(-90),
                endAngle: .degrees(90),
                clockwise: false)
          
            path.addQuadCurve(
                to: CGPoint(x: midWidth, y: midHeight + radius),
                control: CGPoint(x: midWidth + radius, y: midHeight + radius - 10)
            )
            
            path.addQuadCurve(
                to: CGPoint(x: 0, y: midHeight + radius),
                control: CGPoint(x: midWidth - radius, y: midHeight + radius - 10)
            )
        }
    }
}

#Preview {
    ZStack {
        PeanutShape()
            .stroke(lineWidth: 1)
            .foregroundStyle(.white)
            .frame(width: 140)
            .padding()
    }
}
