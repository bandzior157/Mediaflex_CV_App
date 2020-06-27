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
        
        let resume = Resume(experience: [CompanyExperience(companyName: "company", companyLogoUrlString: "logo", role: "role")])
        sut.setResume(resume)
        
        let expected = [ExperienceViewModel(cellViewModels: [CellViewModel(title: "company\nrole", imageUrlString: "logo", selectable: false)])]
        XCTAssertEqual(view.updateViewModels, expected)
    }
    
    
    // MARK: - Helpers
    
    private func makeSUT() -> ExperiencePresenter {
        ExperiencePresenter()
    }
    
}
