//
//  TabBarDelegate.swift
//  CustomTabBarAnim
//
//  Created by MB on 14/09/2020.
//  Copyright © 2020 MB. All rights reserved.
//

import Foundation
import UIKit

class TabBarDelegate: NSObject, UITabBarControllerDelegate {
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        
        let selectedViewController = tabBarController.selectedViewController
        
        if selectedViewController == nil || viewController == selectedViewController {
            return false
        }
        
        guard let controllerIndex = tabBarController.viewControllers?.firstIndex(of: viewController) else {
            return true
        }
        
        guard let fromView = selectedViewController?.view else {
            return true
        }
        
        guard let toView = viewController.view else {
            return true
        }
        
        let viewSize: CGRect = fromView.frame

        fromView.superview?.addSubview(toView)
        
        let scrollRight = controllerIndex > tabBarController.selectedIndex
        let screenWidth = UIScreen.main.bounds.size.width
        
        toView.frame = CGRect(x: scrollRight ? screenWidth : -screenWidth, y: viewSize.origin.y, width: screenWidth, height: viewSize.size.height)
        
        UIView.animate(withDuration: 0.3, delay: 0, options: [.curveEaseInOut], animations: {
            
            fromView.frame = CGRect(x: scrollRight ? -screenWidth : screenWidth, y: viewSize.origin.y, width: screenWidth, height: viewSize.size.height)
            
            toView.frame = CGRect(x: 0, y: viewSize.origin.y, width: screenWidth, height: viewSize.size.height)
            
        }) { (success) in
            if (success) {
                fromView.removeFromSuperview()
                tabBarController.selectedIndex = controllerIndex
            }
        }
        
        return false
    }
}
