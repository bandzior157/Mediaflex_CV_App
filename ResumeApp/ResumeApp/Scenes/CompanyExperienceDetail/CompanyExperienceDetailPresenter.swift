//
//  CompanyExperienceDetailPresenter.swift
//  ResumeApp
//
//  Created by Damian Tabański on 29/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

class CompanyExperienceDetailPresenter {
    
    var view: CompanyExperienceDetailViewing?
    
    private let companyExperience: CompanyExperience
    
    init(companyExperience: CompanyExperience) {
        self.companyExperience = companyExperience
    }
    
}

extension CompanyExperienceDetailPresenter: CompanyExperienceDetailPresenting {
    
    func viewDidLoad() {
        let viewModel = CompanyExperienceDetailViewModel(companyLogoUrlString: companyExperience.companyLogoUrlString, companyName: companyExperience.companyName, role: companyExperience.role)
        view?.update(viewModel: viewModel)
    }
    
}
