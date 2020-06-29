//
//  UrlBrowserHandlingErrorTests.swift
//  ResumeAppTests
//
//  Created by Łukasz Bazior on 29/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import XCTest
@testable import ResumeApp

class UrlBrowserHandlingErrorTests: XCTestCase {
    
    func test_errorDescription() {
        XCTAssertEqual(UrlBrowserHandlingError.unknownError.errorDescription, "Unknown error occured.")
        XCTAssertEqual(UrlBrowserHandlingError.unableToOpen.errorDescription, "Unable to open browser.")
        XCTAssertEqual(UrlBrowserHandlingError.incorrectUrl.errorDescription, "Incorrect url.")
    }
    
}
