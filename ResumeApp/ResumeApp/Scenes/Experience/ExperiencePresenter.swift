//
//  ExperiencePresenter.swift
//  ResumeApp
//
//  Created by Łukasz Bazior on 27/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import Foundation

class ExperiencePresenter {
    
    var view: ExperienceViewing?
    var router: Routing?
    
    private(set) var experience: [CompanyExperience] = [] {
        didSet {
            view?.update(presentableModel: ExperiencePresentableModel(cellPresentableModels: experience.map { CellPresentableModel(companyExperience: $0) }))
        }
    }
    
}

extension ExperiencePresenter: ResumeSetting {
    
    func setResume(_ resume: Resume) {
        self.experience = resume.experience
    }
    
}

extension ExperiencePresenter: ExperiencePresenting {
    
    func didSelect(row: Int) {
        router?.show(companyExperience: experience[row])
    }
    
}

extension CellPresentableModel {
    init(companyExperience: CompanyExperience) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM.yyyy"
        
        let datesText = "\(dateFormatter.string(from: companyExperience.dateFrom)) - \(dateFormatter.string(from: companyExperience.dateTo))"
        
        self.init(
            title: "\(companyExperience.companyName)\n\(companyExperience.role)",
            subtitle: datesText,
            image: .init(type: .url(string: companyExperience.companyLogoUrlString), size: Size(width: 80, height: 80)),
            selectable: true)
    }
}
