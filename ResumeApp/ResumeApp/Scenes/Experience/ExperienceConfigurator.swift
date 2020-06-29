//
//  ExperienceConfigurator.swift
//  ResumeApp
//
//  Created by Damian Tabański on 29/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

class ExperienceConfigurator {
    
    let viewController: ExperienceViewController
    let presenter: ExperiencePresenter
    let router: Router
    
    init(viewController: ExperienceViewController = ExperienceViewController(), presenter: ExperiencePresenter = ExperiencePresenter(), router: Router = Router()) {
        self.viewController = viewController
        self.presenter = presenter
        self.router = router
    }
    
}

extension ExperienceConfigurator: Configurating {
    
    func configure() {
        viewController.presenter = WeakRef(presenter)
        
        presenter.view = viewController
        presenter.router = router
        
        router.viewController = viewController
    }
    
}
