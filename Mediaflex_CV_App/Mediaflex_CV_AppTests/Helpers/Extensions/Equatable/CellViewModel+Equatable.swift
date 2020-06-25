//
//  CellViewModel+Equatable.swift
//  Mediaflex_CV_AppTests
//
//  Created by Damian Tabański on 25/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

@testable import Mediaflex_CV_App

extension CellViewModel: Equatable {
    
    public static func ==(lhs: CellViewModel, rhs: CellViewModel) -> Bool {
        lhs.title == rhs.title &&
            lhs.imageName == rhs.imageName &&
            lhs.selectable == rhs.selectable
    
    }

}
