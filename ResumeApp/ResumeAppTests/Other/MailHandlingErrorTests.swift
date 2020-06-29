//
//  MailHandlingErrorTests.swift
//  ResumeAppTests
//
//  Created by Damian Tabański on 29/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import XCTest
@testable import ResumeApp

class MailHandlingErrorTests: XCTestCase {
    
    func test_errorDescription() {
        XCTAssertEqual(MailHandlingError.unableToSend.errorDescription, "Unable to send mail.")
    }
    
}
