//
//  ScrollAnimationUtil.swift
//  SlideNews
//
//  Created by Kavsoft on 05/03/24.
//

import SwiftUI

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
