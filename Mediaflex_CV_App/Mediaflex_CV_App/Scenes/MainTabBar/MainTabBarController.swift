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
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        let first = generalView
        first.tabBarItem.title = "General"
        first.tabBarItem.image = UIImage(systemName: "person.crop.circle")
        
        addChild(first)
        presenter?.viewDidLoad()
    }
    
}

extension MainTabBarController: MainTabBarViewing {
    func update(viewModel: MainTabBarViewModel) {
        generalView.update(viewModel: viewModel.general)
    }
}
