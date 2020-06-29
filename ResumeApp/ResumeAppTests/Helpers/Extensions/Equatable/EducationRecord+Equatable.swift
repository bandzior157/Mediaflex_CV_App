//
//  EducationRecord+Equatable.swift
//  ResumeAppTests
//
//  Created by Łukasz Bazior on 29/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

@testable import ResumeApp

extension EducationRecord: Equatable {
    public static func ==(lhs: EducationRecord, rhs: EducationRecord) -> Bool {
        lhs.schoolName == rhs.schoolName &&
            lhs.schoolLogoUrlString == rhs.schoolLogoUrlString &&
            lhs.degree == rhs.degree &&
            lhs.specialization == rhs.specialization &&
            lhs.dateFrom == rhs.dateFrom &&
            lhs.dateTo == rhs.dateTo
    }
}
