//
//  CompanyExperience.swift
//  ResumeApp
//
//  Created by Łukasz Bazior on 27/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import Foundation

struct CompanyExperience {
    let companyName: String
    let companyLogoUrlString: String
    let role: String
    let dateFrom: Date
    let dateTo: Date
    let details: [CompanyExperienceDetails]
}

extension CompanyExperience: Decodable {
    private enum CodingKeys: String, CodingKey {
        case companyName = "company_name"
        case companyLogoUrlString = "company_logo_url"
        case role
        case dateFrom = "date_from"
        case dateTo = "date_to"
        case details
    }
}
