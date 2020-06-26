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
    typealias ExperienceView = UIViewController
    
    private var generalView: GeneralView
    private var skillsView: SkillsView
    private var experienceView: ExperienceView
    
    var presenter: ResumeTabBarPresenting?

    init(generalView: GeneralView = GeneralViewController(),
         skillsView: SkillsView = SkillsViewController(),
         experienceView: ExperienceView = ExperienceViewController()
    ) {
        self.generalView = generalView
        self.skillsView = skillsView
        self.experienceView = experienceView
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabBar()
        
        configureGeneralView()
        configureSkillsView()
        configureExperienceView()
        
        addChilds()
        
        presenter?.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        presenter?.viewDidLoad()
    }
    
    private func setupTabBar() {
        tabBarController?.tabBar.backgroundColor = .systemBackground
        tabBarController?.tabBar.isTranslucent = false
    }
    
    private func configureGeneralView() {
        generalView.tabBarItem.title = "General"
        generalView.tabBarItem.image = UIImage(systemName: "person.crop.circle")
    }
    
    private func configureSkillsView() {
        skillsView.title = "Skills"
        skillsView.tabBarItem.image = UIImage(systemName: "star.fill")
    }
    
    private func configureExperienceView() {
        experienceView.title = "Experience"
        experienceView.tabBarItem.image = UIImage(systemName: "briefcase.fill")
    }
    
    private func addChilds() {
        addChild(generalView)
        addChild(TealNavigationController(rootViewController: skillsView))
        addChild(TealNavigationController(rootViewController: experienceView))
    }
    
}
