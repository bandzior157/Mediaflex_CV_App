//
//  PersonViewModel+Equatable.swift
//  Mediaflex_CV_AppTests
//
//  Created by Damian Tabański on 25/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

@testable import Mediaflex_CV_App

extension PersonViewViewModel: Equatable {
    
    public static func ==(lhs: PersonViewViewModel, rhs: PersonViewViewModel) -> Bool {
        lhs.fullName == rhs.fullName &&
            lhs.imageUrl == rhs.imageUrl &&
            lhs.role == rhs.role
    }
    
}
