//
//  EducationPresentableModel+Equatable.swift
//  ResumeAppTests
//
//  Created by Łukasz Bazior on 29/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

@testable import ResumeApp

extension EducationPresentableModel: Equatable {
    
    public static func ==(lhs: EducationPresentableModel, rhs: EducationPresentableModel) -> Bool {
        lhs.cellPresentableModels == rhs.cellPresentableModels
    }
    
}
