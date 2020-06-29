//
//  SkillsGroup+Equatable.swift
//  ResumeAppTests
//
//  Created by Damian Tabański on 29/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

@testable import ResumeApp

extension SkillsGroup: Equatable {
    public static func ==(lhs: SkillsGroup, rhs: SkillsGroup) -> Bool {
        lhs.title == rhs.title &&
            lhs.skills == rhs.skills
    }
}
