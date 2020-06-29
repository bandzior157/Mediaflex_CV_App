//
//  PhoneNumberHandlingErrorTests.swift
//  ResumeAppTests
//
//  Created by Damian Tabański on 29/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import XCTest
@testable import ResumeApp

class PhoneNumberHandlingErrorTests: XCTestCase {
    
    func test_errorDescription() {
        XCTAssertEqual(PhoneNumberHandlingError.unableToCall.errorDescription, "Can not call.")
        XCTAssertEqual(PhoneNumberHandlingError.wrongPhoneNumber.errorDescription, "Phone number seems to be wrong.")
    }
    
}
