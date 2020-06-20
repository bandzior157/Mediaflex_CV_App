//
//  GeneralViewModel+Equatable.swift
//  Mediaflex_CV_AppTests
//
//  Created by Łukasz Bazior on 20/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

@testable import Mediaflex_CV_App

extension GeneralViewModel: Equatable {
    public static func ==(lhs: GeneralViewModel, rhs: GeneralViewModel) -> Bool {
        lhs.name == rhs.name &&
            lhs.role == rhs.role &&
            lhs.summary == rhs.summary &&
            lhs.email == rhs.email &&
            lhs.phone == rhs.phone &&
            lhs.linkedIn == rhs.linkedIn &&
            lhs.github == rhs.github
    }
}
