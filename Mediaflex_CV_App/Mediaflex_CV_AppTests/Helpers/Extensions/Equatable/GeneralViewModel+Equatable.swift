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
        lhs.personViewViewModel == rhs.personViewViewModel &&
            lhs.elements == rhs.elements
    }
    
}
