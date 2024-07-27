//
//  UINavigationControllerExt.swift
//  SlideNews
//
//  Created by Aman Kumar on 17/05/24.
//

import SwiftUI

extension UINavigationController {
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = nil
    }
}
