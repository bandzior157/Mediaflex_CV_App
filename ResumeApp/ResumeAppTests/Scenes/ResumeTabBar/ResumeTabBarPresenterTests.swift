//
//  ResumeTabBarPresenterTests.swift
//  ResumeAppTests
//
//  Created by Łukasz Bazior on 21/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import XCTest
@testable import ResumeApp

class ResumeTabBarPresenterTests: XCTestCase {
        
    let mockResumeSetter = MockResumeSetter()
    
    func test_resumeService_fetchResume_getCalledOn_viewDidLoad() {
        let service = MockResumeService()
        let sut = makeSUT(service)
        sut.viewDidLoad()
        XCTAssertEqual(service.fetchResumeCounter, 1)
    }
    
    func test_generalPresenter_setResume_getCalledOn_didFetchResume() {
        let resume = Resume()
        let sut = makeSUT()
        sut.generalResumeSetter = mockResumeSetter
        sut.didFetchResume(resume)
        XCTAssertEqual(mockResumeSetter.resumes, [resume])
    }
    
    func test_skillsPresenter_setResume_getCalledOn_didFetchResume() {
        let resume = Resume()
        let sut = makeSUT()
        sut.skillsResumeSetter = mockResumeSetter
        sut.didFetchResume(resume)
        XCTAssertEqual(mockResumeSetter.resumes, [resume])
    }
    
    
    // MARK: - Helpers
    
    private func makeSUT(_ service: MockResumeService = MockResumeService()) -> ResumeTabBarPresenter {
        ResumeTabBarPresenter(service: service)
    }
    
}
