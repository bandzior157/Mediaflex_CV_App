//
//  EducationConfigurator.swift
//  ResumeApp
//
//  Created by Damian Tabański on 29/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

class EducationConfigurator {
    
    let viewController: EducationViewController
    let presenter: EducationPresenter
    
    init(viewController: EducationViewController = EducationViewController(), presenter: EducationPresenter = EducationPresenter()) {
        self.viewController = viewController
        self.presenter = presenter
    }
    
}

extension EducationConfigurator: Configurating {
    
    func configure() {
        presenter.view = viewController
    }
    
}
