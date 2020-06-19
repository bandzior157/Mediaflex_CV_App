//
//  Mediaflex_CV_AppTests.swift
//  Mediaflex_CV_AppTests
//
//  Created by Łukasz Bazior on 19/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import XCTest
@testable import Mediaflex_CV_App

class Mediaflex_CV_AppTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

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

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        addChild(UIViewController())
    }
    
}
