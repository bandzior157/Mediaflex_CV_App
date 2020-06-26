//
//  ExperienceViewControllerTests.swift
//  Mediaflex_CV_AppTests
//
//  Created by Damian Tabański on 27/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import XCTest
@testable import Mediaflex_CV_App

class ExperienceViewControllerTests: XCTestCase {
    
    func test_title() {
        XCTAssertEqual(makeSUT().title, "Experience")
    }
    
    
    // MARK: - Helpers
    
    private func makeSUT() -> ExperienceViewController {
        let sut = ExperienceViewController()
        sut.loadViewIfNeeded()
        return sut
    }
    
}
