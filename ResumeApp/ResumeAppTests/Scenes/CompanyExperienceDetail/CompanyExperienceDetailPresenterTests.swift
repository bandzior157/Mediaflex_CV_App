//
//  CompanyExperienceDetailPresenterTests.swift
//  ResumeAppTests
//
//  Created by Damian Tabański on 29/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import XCTest
@testable import ResumeApp

class CompanyExperienceDetailPresenterTests: XCTestCase {
    
    func test_callUpdateOnView_onViewDidLoad() {
        let companyExperience = CompanyExperience(companyName: "company nam", companyLogoUrlString: "url", role: "role", dateFrom: Date(), dateTo: Date(), details: [])
        let sut = makeSUT(companyExperience)
        let view = MockCompanyExperienceDetailView()
        sut.view = view
        
        sut.viewDidLoad()
        
        let expected = [CompanyExperienceDetailViewModel(companyLogoUrlString: "url", companyName: "company nam", role: "role")]
        XCTAssertEqual(view.updateViewModels, expected)
    }
    
    
    // MARK: - Helpers
    
    private func makeSUT(_ companyExperience: CompanyExperience) -> CompanyExperienceDetailPresenter {
        CompanyExperienceDetailPresenter(companyExperience: companyExperience)
    }
    
}

class MockCompanyExperienceDetailView: CompanyExperienceDetailViewing {
    
    private(set) var updateViewModels = [CompanyExperienceDetailViewModel]()
    
    func update(viewModel: CompanyExperienceDetailViewModel) {
        updateViewModels.append(viewModel)
    }
    
}
