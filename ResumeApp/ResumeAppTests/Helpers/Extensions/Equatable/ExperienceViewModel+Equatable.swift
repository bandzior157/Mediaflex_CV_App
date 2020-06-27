//
//  ExperienceViewModel+Equatable.swift
//  ResumeAppTests
//
//  Created by Damian Tabański on 27/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

@testable import ResumeApp

extension ExperienceViewModel: Equatable {
    
    public static func ==(lhs: ExperienceViewModel, rhs: ExperienceViewModel) -> Bool {
        lhs.cellViewModels == rhs.cellViewModels
    }
    
}
