//
//  BottomNavCustomShape.swift
//  Slide News
//
//  Created by Aman Kumar on 28/04/24.
//

import SwiftUI

struct BottomNavCustomShape: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            let width = Double(rect.width)
            let height = Double(rect.height)
            let midWidth = width / 2
            let midHeight = height / 2
            
            // Start with a semicircle at the left end
            path.addArc(
                center: CGPoint(x: 0, y: midHeight),
                radius: CGFloat(50),
                startAngle: .degrees(90),
                endAngle: .degrees(-90),
                clockwise: false)
            
            // Smooth Curves
            path.addQuadCurve(
                to: CGPoint(x: midWidth, y: midHeight),
                control: CGPoint(x: width * 0.25, y: height * 0.25)
            )
            
            path.addQuadCurve(
                to: CGPoint(x: width, y: midHeight),
                control: CGPoint(x: width * 0.75, y: height * 0.75)
            )
            
            // End with a semicircle at the right end
            path.addArc(
                center: CGPoint(x: width, y: midHeight),
                radius: CGFloat(50),
                startAngle: .degrees(-90),
                endAngle: .degrees(90),
                clockwise: false)
        }
    }
}

#Preview {
    ZStack {
        BottomNavCustomShape()
            .stroke(lineWidth: 1)
            .foregroundStyle(.white)
            .frame(width: 200, height: 200)
            .padding()
    }
}
