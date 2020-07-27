//
//  GeneralPresentableModel+Equatable.swift
//  ResumeAppTests
//
//  Created by Łukasz Bazior on 20/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

@testable import ResumeApp

extension GeneralPresentableModel: Equatable {
    
    public static func ==(lhs: GeneralPresentableModel, rhs: GeneralPresentableModel) -> Bool {
        lhs.personViewViewModel == rhs.personViewViewModel &&
            lhs.elements == rhs.elements
    }
    
}
