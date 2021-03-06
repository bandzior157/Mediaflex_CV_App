//
//  MailHandlingError.swift
//  ResumeApp
//
//  Created by Łukasz Bazior on 26/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import Foundation

enum MailHandlingError: Error {
    case unableToSend
}

extension MailHandlingError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .unableToSend:
            return "Unable to send mail."
        }
    }
}
