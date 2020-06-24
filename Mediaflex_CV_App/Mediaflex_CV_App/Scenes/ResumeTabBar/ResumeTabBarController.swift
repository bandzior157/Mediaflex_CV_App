//
//  ResumeTabBarController.swift
//  Mediaflex_CV_App
//
//  Created by Łukasz Bazior on 19/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import UIKit

class ResumeTabBarController: UITabBarController {
    
    typealias GeneralView = UIViewController & GeneralViewing
    
    private var generalView: GeneralView
    
    var presenter: ResumeTabBarPresenting?

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
    
    override func viewDidAppear(_ animated: Bool) {
        presenter?.viewDidLoad()
    }
    
}
