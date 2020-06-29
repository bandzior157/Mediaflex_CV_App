//
//  CompanyExperienceDetailViewModel+Equatable.swift
//  ResumeAppTests
//
//  Created by Łukasz Bazior on 29/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

@testable import ResumeApp

extension CompanyExperienceDetailViewModel: Equatable {
    
    public static func ==(lhs: CompanyExperienceDetailViewModel, rhs: CompanyExperienceDetailViewModel) -> Bool {
        lhs.companyLogoUrlString == rhs.companyLogoUrlString &&
            lhs.companyName == rhs.companyName &&
            lhs.role == rhs.role &&
            lhs.dates == rhs.dates &&
            lhs.sections == rhs.sections
    }
    
}
