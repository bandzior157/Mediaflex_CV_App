//
//  CompanyExperienceDetailViewModel.swift
//  ResumeApp
//
//  Created by Damian Tabański on 29/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import Foundation

struct CompanyExperienceDetailViewModel {
    let companyLogoUrlString: String
    let companyName: String
    let role: String
    let dates: String
}

extension CompanyExperienceDetailViewModel {
    
    init(companyExperience: CompanyExperience) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM.yyyy"
            
        self.companyLogoUrlString = companyExperience.companyLogoUrlString
        self.companyName = companyExperience.companyName
        self.role = companyExperience.role
        self.dates = "\(dateFormatter.string(from: companyExperience.dateFrom)) - \(dateFormatter.string(from: companyExperience.dateTo))"
    }
    
}
