//
//  CompanyExperienceHeaderViewModel.swift
//  ResumeApp
//
//  Created by Damian Tabański on 29/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

struct CompanyExperienceHeaderViewModel {
    let companyLogoUrlString: String
    let companyName: String
    let role: String
}

extension CompanyExperienceHeaderViewModel {
    
    init(viewModel: CompanyExperienceDetailViewModel) {
        self.companyLogoUrlString = viewModel.companyLogoUrlString
        self.companyName = viewModel.companyName
        self.role = viewModel.role
    }
    
}
