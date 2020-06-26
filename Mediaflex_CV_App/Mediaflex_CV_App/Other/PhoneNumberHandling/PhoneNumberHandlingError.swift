//
//  PhoneNumberHandlingError.swift
//  Mediaflex_CV_App
//
//  Created by Damian Tabański on 26/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import Foundation

enum PhoneNumberHandlingError: Error {
    case wrongPhoneNumber
    case unableToCall
}

extension PhoneNumberHandlingError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .wrongPhoneNumber:
            return "Phone number seems to be wrong."
        case .unableToCall:
            return "Can not call."
        }
    }
}
