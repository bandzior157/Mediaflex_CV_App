//
//  CompanyExperienceDetails.swift
//  ResumeApp
//
//  Created by Łukasz Bazior on 28/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

struct CompanyExperienceDetails {
    let title: String
    let elements: [String]
}

extension CompanyExperienceDetails: Decodable {
    private enum CodingKeys: String, CodingKey {
        case title
        case elements
    }
}
