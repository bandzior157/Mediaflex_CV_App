//
//  GeneralConfigurator.swift
//  ResumeApp
//
//  Created by Damian Tabański on 29/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

class GeneralConfigurator {
    
    private(set) var viewController: GeneralViewController
    private(set) var presenter: GeneralPresenter
    private(set) var mailHandler: MailHandler
    
    init(viewController: GeneralViewController = GeneralViewController(),
         presenter: GeneralPresenter = GeneralPresenter(),
         mailHandler: MailHandler = MailHandler()) {
        self.viewController = viewController
        self.presenter = presenter
        self.mailHandler = mailHandler
    }
    
}

extension GeneralConfigurator: Configurating {
    
    func configure() {
        viewController.presenter = WeakRef(presenter)
        
        presenter.view = viewController
        presenter.mailHandler = mailHandler

        mailHandler.viewController = viewController
    }
    
}
