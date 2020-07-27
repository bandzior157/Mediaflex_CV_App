//
//  CompanyExperienceDetailPresentableModel.swift
//  ResumeApp
//
//  Created by Łukasz Bazior on 29/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import Foundation

struct CompanyExperienceDetailPresentableModel {
    let companyLogoUrlString: String
    let companyName: String
    let role: String
    let dates: String
    let sections: [SectionViewModel]
    
    init(companyLogoUrlString: String, companyName: String, role: String, dates: String, sections: [SectionViewModel] = []) {
        self.companyLogoUrlString = companyLogoUrlString
        self.companyName = companyName
        self.role = role
        self.dates = dates
        self.sections = sections
    }
}

extension CompanyExperienceDetailPresentableModel {
    
    init(companyExperience: CompanyExperience) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM.yyyy"
            
        self.companyLogoUrlString = companyExperience.companyLogoUrlString
        self.companyName = companyExperience.companyName
        self.role = companyExperience.role
        self.dates = "\(dateFormatter.string(from: companyExperience.dateFrom)) - \(dateFormatter.string(from: companyExperience.dateTo))"
        
        self.sections = companyExperience.details.map {
            let elements = $0.elements.map { CellPresentableModel(title: $0) }
            return SectionViewModel(title: $0.title, elements: elements)
        }
    }
    
}
