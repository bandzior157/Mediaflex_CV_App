//
//  CompanyExperience+Equatable.swift
//  ResumeAppTests
//
//  Created by Łukasz Bazior on 29/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

@testable import ResumeApp

extension CompanyExperience: Equatable {
    
    public static func ==(lhs: CompanyExperience, rhs: CompanyExperience) -> Bool {
        lhs.companyName == rhs.companyName &&
            lhs.companyLogoUrlString == rhs.companyLogoUrlString &&
            lhs.role == rhs.role &&
            lhs.dateFrom == rhs.dateFrom &&
            lhs.dateTo == rhs.dateTo &&
            lhs.details == rhs.details
    }
    
}
