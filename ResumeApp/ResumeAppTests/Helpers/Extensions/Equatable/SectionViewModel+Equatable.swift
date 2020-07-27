//
//  SectionPresentableModel+Equatable.swift
//  ResumeAppTests
//
//  Created by Łukasz Bazior on 25/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

@testable import ResumeApp

extension SectionPresentableModel: Equatable {
    
    public static func ==(lhs: SectionPresentableModel, rhs: SectionPresentableModel) -> Bool {
        lhs.title == rhs.title &&
            lhs.elements == rhs.elements
    }
    
}
