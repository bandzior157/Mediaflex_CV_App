//
//  MockPhoneNumberHandler.swift
//  Mediaflex_CV_AppTests
//
//  Created by Damian Tabański on 26/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

@testable import Mediaflex_CV_App

class MockPhoneNumberHandler: PhoneNumberHandling {
    
    private(set) var calledPhoneNumbers = [String]()
    
    func call(phoneNumber: String) throws {
        calledPhoneNumbers.append(phoneNumber)
    }
    
}
