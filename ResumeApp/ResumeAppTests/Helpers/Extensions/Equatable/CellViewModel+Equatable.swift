//
//  CellViewModel+Equatable.swift
//  ResumeAppTests
//
//  Created by Łukasz Bazior on 25/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

@testable import ResumeApp

extension CellViewModel: Equatable {
    
    public static func ==(lhs: CellViewModel, rhs: CellViewModel) -> Bool {
        lhs.title == rhs.title &&
            lhs.subtitle == rhs.subtitle &&
            lhs.selectable == rhs.selectable &&
            lhs.imageViewModel == rhs.imageViewModel
    }

}
