//
//  SectionViewModel+Equatable.swift
//  ResumeAppTests
//
//  Created by Łukasz Bazior on 25/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

@testable import ResumeApp

extension SectionViewModel: Equatable {
    
    public static func ==(lhs: SectionViewModel, rhs: SectionViewModel) -> Bool {
        lhs.title == rhs.title &&
            lhs.elements == rhs.elements
    }
    
}
