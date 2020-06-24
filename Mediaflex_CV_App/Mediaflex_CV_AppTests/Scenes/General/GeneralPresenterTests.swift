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
        XCTAssertEqual(view.updateViewModels, [GeneralViewModel(name: "full name", imageUrl: "imageUrl", role: "role", elements: [])])
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
