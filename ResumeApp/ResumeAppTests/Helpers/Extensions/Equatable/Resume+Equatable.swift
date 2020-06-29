//
//  Resume+Equatable.swift
//  ResumeAppTests
//
//  Created by Łukasz Bazior on 21/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

@testable import ResumeApp

extension Resume: Equatable {
    public static func ==(lhs: Resume, rhs: Resume) -> Bool {
        lhs.name == rhs.name &&
            lhs.imageUrl == rhs.imageUrl &&
            lhs.role == rhs.role &&
            lhs.email == rhs.email &&
            lhs.phoneNumber == rhs.phoneNumber &&
            lhs.linkedInUrl == rhs.linkedInUrl &&
            lhs.gitHubUrl == rhs.gitHubUrl &&
            lhs.skillsGroups == rhs.skillsGroups &&
            lhs.experience == rhs.experience &&
            lhs.education == rhs.education
    }
}
