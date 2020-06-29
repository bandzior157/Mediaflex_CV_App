//
//  MockCompanyExperienceDetailPresenter.swift
//  ResumeAppTests
//
//  Created by Łukasz Bazior on 29/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

@testable import ResumeApp

class MockCompanyExperienceDetailPresenter: CompanyExperienceDetailPresenting {
    
    private(set) var viewDidLoadCounter = 0
    
    func viewDidLoad() {
        viewDidLoadCounter += 1
    }
    
}
