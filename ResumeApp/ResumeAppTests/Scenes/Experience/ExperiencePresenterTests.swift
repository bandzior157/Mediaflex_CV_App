//
//  ExperiencePresenterTests.swift
//  ResumeAppTests
//
//  Created by Damian Tabański on 27/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import XCTest
@testable import ResumeApp

class ExperiencePresenterTests: XCTestCase {
    
    func test_updateViewModel_afterSettingResume() {
        let sut = makeSUT()
        let view = MockExperienceView()
        sut.view = view
        
        let resume = Resume(experience: [CompanyExperience(companyName: "company", companyLogoUrlString: "logo", role: "role", dateFrom: Date(), dateTo: Date())])
        sut.setResume(resume)
        
        let expected = [ExperienceViewModel(cellViewModels: [CellViewModel(title: "company\nrole", image: .init(type: .url(string: "logo"), size: Size(width: 80, height: 80)), selectable: false)])]
        XCTAssertEqual(view.updateViewModels, expected)
    }
    
    
    // MARK: - Helpers
    
    private func makeSUT() -> ExperiencePresenter {
        ExperiencePresenter()
    }
    
}
