//
//  CompanyExperienceHeaderViewModel.swift
//  ResumeApp
//
//  Created by Łukasz Bazior on 29/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

struct CompanyExperienceHeaderViewModel {
    let companyImage: ImageViewModel?
    let companyName: String
    let role: String
    let dates: String
}

extension CompanyExperienceHeaderViewModel {
    
    init(viewModel: CompanyExperienceDetailPresentableModel) {
        self.companyImage = ImageViewModel(type: .url(string: viewModel.companyLogoUrlString), size: Size(width: 120, height: 120))
        self.companyName = viewModel.companyName
        self.role = viewModel.role
        self.dates = viewModel.dates
    }
    
}
