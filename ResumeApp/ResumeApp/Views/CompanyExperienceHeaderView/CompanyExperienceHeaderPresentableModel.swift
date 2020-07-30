//
//  CompanyExperienceHeaderPresentableModel.swift
//  ResumeApp
//
//  Created by Łukasz Bazior on 29/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

struct CompanyExperienceHeaderPresentableModel {
    let companyImage: ImagePresentableModel?
    let companyName: String
    let role: String
    let dates: String
}

extension CompanyExperienceHeaderPresentableModel {
    
    init(presentableModel: CompanyExperienceDetailPresentableModel) {
        self.companyImage = ImagePresentableModel(type: .url(string: presentableModel.companyLogoUrlString), size: Size(width: 120, height: 120))
        self.companyName = presentableModel.companyName
        self.role = presentableModel.role
        self.dates = presentableModel.dates
    }
    
}
