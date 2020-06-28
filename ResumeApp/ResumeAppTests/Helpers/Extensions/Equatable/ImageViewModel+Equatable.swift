//
//  ImageViewModel+Equatable.swift
//  ResumeAppTests
//
//  Created by Damian Tabański on 28/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

@testable import ResumeApp

extension ImageViewModel: Equatable {
    
    public static func ==(lhs: ImageViewModel, rhs: ImageViewModel) -> Bool {
        lhs.type == rhs.type &&
            lhs.size == rhs.size
    }
    
}
