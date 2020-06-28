//
//  MockRouter.swift
//  ResumeAppTests
//
//  Created by Damian Tabański on 29/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

@testable import ResumeApp

class MockRouter: Routing {
    
    private(set) var showedCompanyExperiences = [CompanyExperience]()
    
    func show(companyExperience: CompanyExperience) {
        showedCompanyExperiences.append(companyExperience)
    }
    
}
