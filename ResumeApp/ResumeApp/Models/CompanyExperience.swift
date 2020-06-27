//
//  CompanyExperience.swift
//  ResumeApp
//
//  Created by Damian Tabański on 27/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

struct CompanyExperience {
    let companyName: String
    let companyLogoUrlString: String
    let role: String
}

extension CompanyExperience: Decodable {
    private enum CodingKeys: String, CodingKey {
        case companyName = "company_name"
        case companyLogoUrlString = "company_logo_url"
        case role
    }
}
