//
//  Resume+Equatable.swift
//  ResumeAppTests
//
//  Created by Łukasz Bazior on 21/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

@testable import ResumeApp

extension Resume: Equatable {
    public static func ==(lhs: Resume, rhs: Resume) -> Bool {
        lhs.name == rhs.name
    }
}
