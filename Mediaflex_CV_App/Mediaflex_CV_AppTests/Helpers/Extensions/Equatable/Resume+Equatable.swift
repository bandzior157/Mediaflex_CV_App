//
//  Resume+Equatable.swift
//  Mediaflex_CV_AppTests
//
//  Created by Łukasz Bazior on 21/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

@testable import Mediaflex_CV_App

extension Resume: Equatable {
    public static func ==(lhs: Resume, rhs: Resume) -> Bool {
        lhs.name == rhs.name
    }
}
