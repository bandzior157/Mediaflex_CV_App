//
//  ImageType+Equatable.swift
//  ResumeAppTests
//
//  Created by Damian Tabański on 28/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

@testable import ResumeApp

extension ImageType: Equatable {
    
    public static func ==(lhs: ImageType, rhs: ImageType) -> Bool {
        switch (lhs, rhs) {
        case (let .url(lhsString), let .url(rhsString)):
            return lhsString == rhsString
        case (let .named(lhsName), let .named(rhsName)):
            return lhsName == rhsName
        default:
            return false
        }
    }
    
}
