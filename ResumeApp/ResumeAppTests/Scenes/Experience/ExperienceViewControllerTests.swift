//
//  ExperienceViewControllerTests.swift
//  ResumeAppTests
//
//  Created by Damian Tabański on 27/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import XCTest
@testable import ResumeApp

class ExperienceViewControllerTests: XCTestCase {
    
    
    // MARK: - Helpers
    
    private func makeSUT() -> ExperienceViewController {
        let sut = ExperienceViewController()
        sut.loadViewIfNeeded()
        return sut
    }
    
}
