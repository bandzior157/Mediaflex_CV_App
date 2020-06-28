//
//  Size+Equatable.swift
//  ResumeAppTests
//
//  Created by Damian Tabański on 28/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

@testable import ResumeApp

extension Size: Equatable {
    
    public static func ==(lhs: Size, rhs: Size) -> Bool {
        lhs.width == rhs.width &&
            lhs.height == rhs.height
    }
    
}
