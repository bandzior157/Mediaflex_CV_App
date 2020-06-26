//
//  GeneralPresenterTests.swift
//  Mediaflex_CV_AppTests
//
//  Created by Damian Tabański on 24/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import XCTest
@testable import Mediaflex_CV_App

class GeneralPresenterTests: XCTestCase {
    
    func test_setResume_callsViewUpdateWithGeneralViewModel() {
        let sut = makeSUT(GeneralCellTypesProvider())
        let view = MockGeneralView()
        let resume = Resume(name: "full name", imageUrl: "imageUrl", role: "role")
        sut.view = view
        sut.setResume(resume)
        
        let summary = CellViewModel(title: resume.summary, imageName: nil, selectable: false)
        let email = CellViewModel(title: "Email", subtitle: resume.email, imageName: "email", selectable: true)
        let phone = CellViewModel(title: "Phone", subtitle: resume.phone, imageName: "phone", selectable: true)
        let linkedIn = CellViewModel(title: "LinkedIn", subtitle: resume.linkedInUrl, imageName: "linkedIn", selectable: true)
        let github = CellViewModel(title: "GitHub", subtitle: resume.github, imageName: "github", selectable: true)

        let expected = [GeneralViewModel(personViewViewModel: PersonViewViewModel(fullName: "full name", imageUrl: "imageUrl", role: "role"), elements: [summary, email, phone, linkedIn, github])]
        XCTAssertEqual(view.updateViewModels, expected)
    }
    
    
    // MARK: - Helpers
    
    private func makeSUT(_ cellTypesProvider: GeneralCellTypesProviding = MockGeneralCellTypesProvider()) -> GeneralPresenter {
        GeneralPresenter(cellTypesProvider: cellTypesProvider)
    }
    
}

class MockGeneralCellTypesProvider: GeneralCellTypesProviding {
    let generalCellTypes: [GeneralCellType]
    
    init(generalCellTypes: [GeneralCellType] = []) {
        self.generalCellTypes = generalCellTypes
    }
    
    func ordered(for resume: Resume) -> [GeneralCellType] {
        generalCellTypes
    }
}

class MockGeneralView: GeneralViewing {
    
    private(set) var updateViewModels = [GeneralViewModel]()
    
    func update(viewModel: GeneralViewModel) {
        updateViewModels.append(viewModel)
    }
    
}
