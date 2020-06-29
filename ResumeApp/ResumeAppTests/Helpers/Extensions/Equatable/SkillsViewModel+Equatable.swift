//
//  SkillsViewModel+Equatable.swift
//  ResumeAppTests
//
//  Created by Łukasz Bazior on 25/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

@testable import ResumeApp

extension SkillsViewModel: Equatable {
    
    public static func ==(lhs: SkillsViewModel, rhs: SkillsViewModel) -> Bool {
        lhs.sections == rhs.sections
    }
    
}
