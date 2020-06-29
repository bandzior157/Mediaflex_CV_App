//
//  SkillsConfigurator.swift
//  ResumeApp
//
//  Created by Damian Tabański on 29/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

class SkillsConfigurator {
    
    let viewController: SkillsViewController
    let presenter: SkillsPresenter

    init(viewController: SkillsViewController = SkillsViewController(),
         presenter: SkillsPresenter = SkillsPresenter()) {
        self.viewController = viewController
        self.presenter = presenter
    }
    
}

extension SkillsConfigurator: Configurating {
    
    func configure() {
        presenter.view = viewController
    }
    
}
