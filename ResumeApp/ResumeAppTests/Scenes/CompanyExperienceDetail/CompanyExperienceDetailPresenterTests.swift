//
//  CompanyExperienceDetailPresenterTests.swift
//  ResumeAppTests
//
//  Created by Łukasz Bazior on 29/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import XCTest
@testable import ResumeApp

class CompanyExperienceDetailPresenterTests: XCTestCase {
    
    func test_callUpdateOnView_onViewDidLoad() {
        let january2000 = Date(timeIntervalSince1970: 949093397)
        let december2010 = Date(timeIntervalSince1970: 1293570197)
        
        let companyExperience = CompanyExperience(companyName: "company nam", companyLogoUrlString: "url", role: "role", dateFrom: january2000, dateTo: december2010, details: [])
        let sut = makeSUT(companyExperience)
        let view = MockCompanyExperienceDetailView()
        sut.view = view
        
        sut.viewDidLoad()
        
        let expected = [CompanyExperienceDetailPresentableModel(companyLogoUrlString: "url", companyName: "company nam", role: "role", dates: "01.2000 - 12.2010")]
        XCTAssertEqual(view.updatePresentableModels, expected)
    }
    
    
    // MARK: - Helpers
    
    private func makeSUT(_ companyExperience: CompanyExperience) -> CompanyExperienceDetailPresenter {
        CompanyExperienceDetailPresenter(companyExperience: companyExperience)
    }
    
}

class MockCompanyExperienceDetailView: CompanyExperienceDetailViewing {
    
    private(set) var updatePresentableModels = [CompanyExperienceDetailPresentableModel]()
    
    func update(presentableModel: CompanyExperienceDetailPresentableModel) {
        updatePresentableModels.append(presentableModel)
    }
    
}
