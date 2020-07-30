//
//  SkillsPresentableModel+Equatable.swift
//  ResumeAppTests
//
//  Created by Łukasz Bazior on 25/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

@testable import ResumeApp

extension SkillsPresentableModel: Equatable {
    
    public static func ==(lhs: SkillsPresentableModel, rhs: SkillsPresentableModel) -> Bool {
        lhs.sections == rhs.sections
    }
    
}
