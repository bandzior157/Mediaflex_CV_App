//
//  SkillsViewModel+Equatable.swift
//  Mediaflex_CV_AppTests
//
//  Created by Damian Tabański on 25/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

@testable import Mediaflex_CV_App

extension SkillsViewModel: Equatable {
    
    public static func ==(lhs: SkillsViewModel, rhs: SkillsViewModel) -> Bool {
        lhs.sections == rhs.sections
    }
    
}
