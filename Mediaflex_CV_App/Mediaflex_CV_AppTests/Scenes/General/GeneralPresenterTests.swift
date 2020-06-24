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
        let sut = makeSUT()
        let view = MockGeneralView()
        let resume = Resume(name: "full name", imageUrl: "imageUrl", role: "role")
        sut.view = view
        sut.setResume(resume)
        
        let summary = CellViewModel(title: resume.summary, imageName: nil, selectable: false)
        let email = CellViewModel(title: resume.email, imageName: "email", selectable: true)
        let phone = CellViewModel(title: resume.phone, imageName: "phone", selectable: true)
        let linkedIn = CellViewModel(title: resume.linkedInUrl, imageName: "linkedIn", selectable: true)

        let expected = [GeneralViewModel(personViewViewModel: PersonViewViewModel(fullName: "full name", imageUrl: "imageUrl", role: "role"), elements: [summary, email, phone, linkedIn])]
        XCTAssertEqual(view.updateViewModels, expected)
    }
    
    
    // MARK: - Helpers
    
    private func makeSUT() -> GeneralPresenter {
        GeneralPresenter()
    }
    
}

class MockGeneralView: GeneralViewing {
    
    private(set) var updateViewModels = [GeneralViewModel]()
    
    func update(viewModel: GeneralViewModel) {
        updateViewModels.append(viewModel)
    }
    
}
