//
//  TealNavigationController.swift
//  ResumeApp
//
//  Created by Łukasz Bazior on 27/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import UIKit

class TealNavigationController: UINavigationController {
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        view.backgroundColor = .systemTeal

        setupNavigationBar()
        setupTabBar()
    }
     
    private func setupNavigationBar() {
        navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.label]
        navigationBar.prefersLargeTitles = true
        navigationBar.backgroundColor = .systemTeal
        navigationBar.barTintColor = .systemTeal
        navigationBar.isTranslucent = true
    }
     
    
    private func setupTabBar() {
        tabBarController?.tabBar.backgroundColor = .systemBackground
        tabBarController?.tabBar.isTranslucent = false
    }
    
}
