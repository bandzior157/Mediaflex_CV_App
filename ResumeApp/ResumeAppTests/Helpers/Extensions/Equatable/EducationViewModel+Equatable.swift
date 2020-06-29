//
//  EducationViewModel+Equatable.swift
//  ResumeAppTests
//
//  Created by Damian Tabański on 29/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

@testable import ResumeApp

extension EducationViewModel: Equatable {
    
    public static func ==(lhs: EducationViewModel, rhs: EducationViewModel) -> Bool {
        lhs.cellViewModels == rhs.cellViewModels
    }
    
}
