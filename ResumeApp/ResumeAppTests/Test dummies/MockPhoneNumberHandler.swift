//
//  MockPhoneNumberHandler.swift
//  ResumeAppTests
//
//  Created by Łukasz Bazior on 26/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

@testable import ResumeApp

class MockPhoneNumberHandler {
    
    private(set) var calledPhoneNumbers = [String]()
    
}

extension MockPhoneNumberHandler: PhoneNumberHandling {
    
    func call(phoneNumber: String) throws {
        calledPhoneNumbers.append(phoneNumber)
    }
    
}
