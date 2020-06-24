//
//  MainTabBarController.swift
//  Mediaflex_CV_App
//
//  Created by Łukasz Bazior on 19/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    typealias GeneralView = UIViewController & GeneralViewing
    
    private var generalView: GeneralView
    
    var presenter: MainTabBarPresenting?

    init(generalView: GeneralView = GeneralViewController()) {
        self.generalView = generalView
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        nil
    }
    
    override func viewDidLoad() {
        generalView.tabBarItem.title = "General"
        generalView.tabBarItem.image = UIImage(systemName: "person.crop.circle")
        
        addChild(generalView)
        presenter?.viewDidLoad()
    }
    
}
