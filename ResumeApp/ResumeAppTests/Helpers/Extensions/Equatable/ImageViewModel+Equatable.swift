//
//  ImagePresentableModel+Equatable.swift
//  ResumeAppTests
//
//  Created by Łukasz Bazior on 28/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

@testable import ResumeApp

extension ImagePresentableModel: Equatable {
    
    public static func ==(lhs: ImagePresentableModel, rhs: ImagePresentableModel) -> Bool {
        lhs.type == rhs.type &&
            lhs.size == rhs.size
    }
    
}
