//
//  ResumeTabBarPresenterTests.swift
//  Mediaflex_CV_AppTests
//
//  Created by Łukasz Bazior on 21/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import XCTest
@testable import Mediaflex_CV_App

class ResumeTabBarPresenterTests: XCTestCase {
    
    func test_resumeService_fetchResume_getCalledOn_viewDidLoad() {
        let service = MockResumeService()
        let sut = makeSUT(service)
        sut.viewDidLoad()
        XCTAssertEqual(service.fetchResumeCounter, 1)
    }
    
    func test_generalPresenter_setResume_getCalledOn_didFetchResume() {
        let resume = Resume(name: "ABC")
        let generalPresenter = MockGeneralPresenter()
        let sut = makeSUT()
        sut.generalPresenter = generalPresenter
        sut.didFetchResume(resume)
        XCTAssertEqual(generalPresenter.resumes, [resume])
    }
    
    
    // MARK: - Helpers
    
    private func makeSUT(_ service: MockResumeService = MockResumeService()) -> ResumeTabBarPresenter {
        ResumeTabBarPresenter(service: service)
    }
    
}

class MockGeneralPresenter: GeneralPresenting {
    
    private(set) var resumes = [Resume]()

    func setResume(_ resume: Resume) {
        resumes.append(resume)
    }
    
}
