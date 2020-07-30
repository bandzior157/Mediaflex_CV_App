//
//  PersonViewPresentableModel+Equatable.swift
//  ResumeAppTests
//
//  Created by Łukasz Bazior on 25/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

@testable import ResumeApp

extension PersonViewPresentableModel: Equatable {
    
    public static func ==(lhs: PersonViewPresentableModel, rhs: PersonViewPresentableModel) -> Bool {
        lhs.fullName == rhs.fullName &&
            lhs.image == rhs.image &&
            lhs.role == rhs.role
    }
    
}
