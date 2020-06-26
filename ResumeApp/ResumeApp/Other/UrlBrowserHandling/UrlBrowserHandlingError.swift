//
//  UrlBrowserHandlingError.swift
//  ResumeApp
//
//  Created by Damian Tabański on 26/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import Foundation

enum UrlBrowserHandlingError: Error {
    case unknownError
    case unableToOpen
    case incorrectUrl
}

extension UrlBrowserHandlingError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .unknownError:
            return "Unknown error occured."
        case .unableToOpen:
            return "Unable to open browser."
        case .incorrectUrl:
            return "Incorrect url."
        }
    }
}
