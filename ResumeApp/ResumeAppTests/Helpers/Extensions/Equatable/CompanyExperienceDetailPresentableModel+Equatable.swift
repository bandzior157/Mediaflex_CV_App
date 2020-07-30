//
//  CompanyExperienceDetailPresentableModel+Equatable.swift
//  ResumeAppTests
//
//  Created by Łukasz Bazior on 29/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

@testable import ResumeApp

extension CompanyExperienceDetailPresentableModel: Equatable {
    
    public static func ==(lhs: CompanyExperienceDetailPresentableModel, rhs: CompanyExperienceDetailPresentableModel) -> Bool {
        lhs.companyLogoUrlString == rhs.companyLogoUrlString &&
            lhs.companyName == rhs.companyName &&
            lhs.role == rhs.role &&
            lhs.dates == rhs.dates &&
            lhs.sections == rhs.sections
    }
    
}
