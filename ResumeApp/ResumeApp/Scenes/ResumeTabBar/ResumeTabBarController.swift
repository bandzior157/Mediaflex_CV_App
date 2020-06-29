//
//  ResumeTabBarController.swift
//  ResumeApp
//
//  Created by Łukasz Bazior on 19/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import UIKit

class ResumeTabBarController: UITabBarController {
    
    typealias GeneralView = UIViewController & GeneralViewing
    typealias SkillsView = UIViewController & SkillsViewing
    typealias ExperienceView = UIViewController
    typealias EducationView = UIViewController & EducationViewing
    
    private var generalView: GeneralView
    private var skillsView: SkillsView
    private var experienceView: ExperienceView
    private var educationView: EducationView
    
    var presenter: ResumeTabBarPresenting?

    init(generalView: GeneralView = GeneralViewController(),
         skillsView: SkillsView = SkillsViewController(),
         experienceView: ExperienceView = ExperienceViewController(),
         educationView: EducationView = EducationViewController()
    ) {
        self.generalView = generalView
        self.skillsView = skillsView
        self.experienceView = experienceView
        self.educationView = educationView
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
        configureEducationView()
        
        addChilds()
        
        presenter?.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
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
    
    private func configureEducationView() {
        educationView.title = "Education"
        educationView.tabBarItem.image = UIImage(systemName: "book.circle.fill")
    }
    
    private func addChilds() {
        addChild(generalView)
        addChild(TealNavigationController(rootViewController: skillsView))
        addChild(TealNavigationController(rootViewController: experienceView))
        addChild(TealNavigationController(rootViewController: educationView))
    }
    
}
