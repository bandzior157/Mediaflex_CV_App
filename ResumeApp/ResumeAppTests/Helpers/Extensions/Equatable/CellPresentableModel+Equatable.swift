//
//  CellPresentableModel+Equatable.swift
//  ResumeAppTests
//
//  Created by Łukasz Bazior on 25/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

@testable import ResumeApp

extension CellPresentableModel: Equatable {
    
    public static func ==(lhs: CellPresentableModel, rhs: CellPresentableModel) -> Bool {
        lhs.title == rhs.title &&
            lhs.subtitle == rhs.subtitle &&
            lhs.selectable == rhs.selectable &&
            lhs.imagePresentableModel == rhs.imagePresentableModel
    }

}
