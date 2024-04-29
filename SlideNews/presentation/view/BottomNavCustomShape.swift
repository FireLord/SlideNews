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
            let height = rect.height
            let width = rect.width
            let midWidth = width / 2
            let midHeight = height / 2
            let radius: CGFloat = 50
            let strength: Double = 5
            let frequency: Double = 10
            let wavelength = width / frequency
            
            
            // First semi-circle
            path.addArc(
                center: CGPoint(x: 0, y: midHeight),
                radius: radius,
                startAngle: .degrees(90),
                endAngle: .degrees(-90),
                clockwise: false)
            
            path.move(to: CGPoint(x: 0, y: midHeight + 50)) // bottom portion cover up
            
            for x in stride(from: 0, through: width - 10, by: 1) {
                // find our current position relative to the wavelength
                let relativeX = x / wavelength
                
                // calculate the sine of that position
                let sine = sin(relativeX)
                
                // multiply that sine by our strength to determine final offset, then move it down to the middle of our view
                let y = strength * sine
                
                // add a line to here
                path.addLine(to: CGPoint(x: x, y: y))
            }
            
            // Second semi-circle
            path.addArc(
                center: CGPoint(x: width, y: midHeight),
                radius: radius,
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
