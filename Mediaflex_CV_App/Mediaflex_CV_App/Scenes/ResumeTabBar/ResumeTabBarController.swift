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
    typealias SkillsView = UIViewController & SkillsViewing
    
    private var generalView: GeneralView
    private var skillsView: SkillsView
    
    var presenter: ResumeTabBarPresenting?

    init(generalView: GeneralView = GeneralViewController(),
         skillsView: SkillsView = SkillsViewController()
    ) {
        self.generalView = generalView
        self.skillsView = skillsView
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureGeneralView()
        configureSkillsView()
        addChilds()
        
        presenter?.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        presenter?.viewDidLoad()
    }
    
    private func configureGeneralView() {
        generalView.tabBarItem.title = "General"
        generalView.tabBarItem.image = UIImage(systemName: "person.crop.circle")
    }
    
    private func configureSkillsView() {
        skillsView.title = "Skills"
        skillsView.tabBarItem.image = UIImage(systemName: "star.fill")
    }
    
    private func addChilds() {
        addChild(generalView)
        addChild(UINavigationController(rootViewController: skillsView))
    }
    
}
