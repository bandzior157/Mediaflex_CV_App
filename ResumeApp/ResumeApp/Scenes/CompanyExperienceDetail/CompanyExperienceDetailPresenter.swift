//
//  CompanyExperienceDetailPresenter.swift
//  ResumeApp
//
//  Created by Łukasz Bazior on 29/06/2020.
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
        view?.update(viewModel: CompanyExperienceDetailPresentableModel(companyExperience: companyExperience))
    }
    
}
