//
//  TopViewUtil.swift
//  Slide News
//
//  Created by Aman Kumar on 28/04/24.
//

import Foundation
import UIKit

@MainActor
func TopViewController(controller: UIViewController? = nil) -> UIViewController? {
    let controller = controller ?? UIApplication.shared.keyWindow?.rootViewController
    
    if let navigationController = controller as? UINavigationController {
        return TopViewController(controller: navigationController.visibleViewController)
    }
    
    if let tabController = controller as? UITabBarController {
        if let selected = tabController.selectedViewController {
            return TopViewController(controller: selected)
        }
    }
    
    if let presented = controller?.presentedViewController {
        return TopViewController(controller: presented)
    }
    
    return controller
}
