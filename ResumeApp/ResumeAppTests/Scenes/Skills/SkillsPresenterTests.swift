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
            SkillsPresentableModel(sections: [
                SectionViewModel(title: "Technical", elements: [
                    CellPresentableModel(title: "Xcode"),
                    CellPresentableModel(title: "Swift")
                ]),
                SectionViewModel(title: "Hidden skills", elements: [
                    CellPresentableModel(title: "Invisibility")
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
    
    private(set) var updateViewModels = [SkillsPresentableModel]()
    
    func update(viewModel: SkillsPresentableModel) {
        updateViewModels.append(viewModel)
    }
    
}
