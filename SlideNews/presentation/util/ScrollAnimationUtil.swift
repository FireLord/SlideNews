//
//  ScrollAnimationUtil.swift
//  SlideNews
//
//  Created by Kavsoft on 05/03/24.
//

import SwiftUI

// horizontal
func minX(_ proxy: GeometryProxy) ->  CGFloat {
    let minX = proxy.frame(in: .scrollView(axis: .horizontal)).minX
    return minX < 0 ? 0 : -minX
}

func progress(_ proxy: GeometryProxy, limit: CGFloat = 2) -> CGFloat {
    let maxX = proxy.frame(in: .scrollView(axis: .horizontal)).maxX
    let width = proxy.bounds(of: .scrollView(axis: .horizontal))?.width ?? 0
    let progress = (maxX / width) - 1.0
    let cappedProgress = min(progress, limit)
    return cappedProgress
}

func scale(_ proxy: GeometryProxy, scale: CGFloat = 0.1) -> CGFloat {
    let progress = progress(proxy)
    return 1 - (progress * scale)
}

func excessMinX(_ proxy: GeometryProxy, offset: CGFloat = 10) -> CGFloat {
    let progress = progress(proxy)
    return progress * offset
}

func rotation(_ proxy: GeometryProxy, rotation: CGFloat = 10) -> Angle {
    let progress = progress(proxy)
    return .init(degrees: progress * rotation)
}

// vertical
func minY(_ proxy: GeometryProxy) ->  CGFloat {
    let minY = proxy.frame(in: .scrollView(axis: .vertical)).minY
    return minY < 0 ? 0 : -minY
}

func progressY(_ proxy: GeometryProxy, limit: CGFloat = 2) -> CGFloat {
    let maxX = proxy.frame(in: .scrollView(axis: .vertical)).maxY
    let height = proxy.bounds(of: .scrollView(axis: .vertical))?.height ?? 0
    let progress = (maxX / height) - 0.5
    let cappedProgress = min(progress, limit)
    return cappedProgress
}

func scaleY(_ proxy: GeometryProxy, scale: CGFloat = 0.1) -> CGFloat {
    let progress = progressY(proxy)
    return 1 - (progress * scale)
}

func excessMinY(_ proxy: GeometryProxy, offset: CGFloat = 10) -> CGFloat {
    let progress = progressY(proxy)
    return progress * offset
}

func rotationY(_ proxy: GeometryProxy, rotation: CGFloat = 10) -> Angle {
    let progress = progressY(proxy)
    return .init(degrees: progress * rotation)
}
