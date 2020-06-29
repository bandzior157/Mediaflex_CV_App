//
//  EducationRecord.swift
//  ResumeApp
//
//  Created by Łukasz Bazior on 29/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import Foundation

struct EducationRecord {
    let schoolName: String
    let schoolLogoUrlString: String
    let degree: String
    let specialization: String
    let dateFrom: Date
    let dateTo: Date
}

extension EducationRecord: Decodable {
    private enum CodingKeys: String, CodingKey {
        case schoolName = "school_name"
        case schoolLogoUrlString = "school_logo_url"
        case degree
        case specialization
        case dateFrom = "date_from"
        case dateTo = "date_to"
    }
}
