//
//  MainViewControllerTests.swift
//  Mediaflex_CV_AppTests
//
//  Created by Łukasz Bazior on 19/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import XCTest
@testable import Mediaflex_CV_App

class MainViewControllerTests: XCTestCase {
    
    func test_childrenCount_equals_one() {
        let sut = makeSUT()
        XCTAssertEqual(sut.children.count, 1)
    }
    
    
    // MARK: - Helpers
    
    private func makeSUT() -> UITabBarController {
        MainTabBarController()
    }
    
}
