//
//  MainTabBarController.swift
//  Mediaflex_CV_App
//
//  Created by Łukasz Bazior on 19/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        let first = UIViewController()
        first.tabBarItem.title = "General"
        first.tabBarItem.image = UIImage(systemName: "person.crop.circle")
        
        addChild(first)
    }
    
}
