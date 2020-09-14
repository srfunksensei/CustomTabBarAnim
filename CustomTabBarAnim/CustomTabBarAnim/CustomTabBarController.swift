//
//  CustomTabBarController.swift
//  CustomTabBarAnim
//
//  Created by MB on 14/09/2020.
//  Copyright © 2020 MB. All rights reserved.
//

import UIKit

class CustomTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewControllers = [
            createNavigationController(tabBarSystemItem: UITabBarItem.SystemItem.favorites, backgroundColor: .red),
            createNavigationController(tabBarSystemItem: UITabBarItem.SystemItem.bookmarks, backgroundColor: .yellow)
        ]
    }
    
    private func createNavigationController(tabBarSystemItem: UITabBarItem.SystemItem, backgroundColor: UIColor) -> UINavigationController {
        let viewController = UIViewController()
        viewController.view.backgroundColor = backgroundColor
        let navController = UINavigationController(rootViewController: viewController)
        navController.tabBarItem = UITabBarItem.init(tabBarSystemItem: tabBarSystemItem, tag: 1)
        return navController
    }
}
