//
//  MainTabBarPresenterTests.swift
//  Mediaflex_CV_AppTests
//
//  Created by Łukasz Bazior on 21/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import XCTest
@testable import Mediaflex_CV_App

class MainTabBarPresenterTests: XCTestCase {
    
    func test_resumeService_fetchResume_getCalledOn_viewDidLoad() {
        let service = MockResumeService()
        let sut = makeSUT(service)
        sut.viewDidLoad()
        XCTAssertEqual(service.fetchResumeCounter, 1)
    }
    
    
    // MARK: - Helpers
    
    private func makeSUT(_ service: MockResumeService = MockResumeService()) -> MainTabBarPresenter {
        MainTabBarPresenter(service: service)
    }
    
}
