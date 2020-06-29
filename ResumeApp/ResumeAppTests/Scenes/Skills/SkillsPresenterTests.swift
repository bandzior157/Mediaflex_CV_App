//
//  SkillsPresenterTests.swift
//  ResumeAppTests
//
//  Created by Łukasz Bazior on 25/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import XCTest
@testable import ResumeApp

class SkillsPresenterTests: XCTestCase {
    
    func test_setResume_callsViewUpdateWithGeneralViewModel() {
        let sut = makeSUT()
        let view = MockSkillsView()
        let resume = Resume(skillsGroups: [
            SkillsGroup(title: "Technical", skills: ["Xcode", "Swift"]),
            SkillsGroup(title: "Hidden skills", skills: ["Invisibility"]),
            SkillsGroup(title: "No skills", skills: [])])
        sut.view = view
        sut.setResume(resume)
    
        let expected = [
            SkillsViewModel(sections: [
                SectionViewModel(title: "Technical", elements: [
                    CellViewModel(title: "Xcode"),
                    CellViewModel(title: "Swift")
                ]),
                SectionViewModel(title: "Hidden skills", elements: [
                    CellViewModel(title: "Invisibility")
                ])
            ])
        ]
        
        XCTAssertEqual(view.updateViewModels, expected)
    }
    
    
    // MARK: - Helpers
    
    private func makeSUT() -> SkillsPresenter {
        SkillsPresenter()
    }
    
}

class MockSkillsView: SkillsViewing {
    
    private(set) var updateViewModels = [SkillsViewModel]()
    
    func update(viewModel: SkillsViewModel) {
        updateViewModels.append(viewModel)
    }
    
}
