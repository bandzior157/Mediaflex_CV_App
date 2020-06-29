//
//  CompanyExperienceDetails+Equatable.swift
//  ResumeAppTests
//
//  Created by Łukasz Bazior on 29/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

@testable import ResumeApp

extension CompanyExperienceDetails: Equatable {
    
    public static func ==(lhs: CompanyExperienceDetails, rhs: CompanyExperienceDetails) -> Bool {
        lhs.title == rhs.title &&
            lhs.elements == rhs.elements
    }
    
}
