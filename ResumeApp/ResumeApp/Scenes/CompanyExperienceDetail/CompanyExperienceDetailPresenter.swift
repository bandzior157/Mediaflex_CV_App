//
//  CompanyExperienceDetailPresenter.swift
//  ResumeApp
//
//  Created by Damian Tabański on 29/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

class CompanyExperienceDetailPresenter {
    
    var view: CompanyExperienceDetailViewing?
    
    let viewModel: CompanyExperienceDetailViewModel
    
    init(viewModel: CompanyExperienceDetailViewModel) {
        self.viewModel = viewModel
    }
    
}

extension CompanyExperienceDetailPresenter: CompanyExperienceDetailPresenting {
    
    func viewDidLoad() {
        view?.update(viewModel: viewModel)
    }
    
}
