//
//  ExperiencePresenter.swift
//  ResumeApp
//
//  Created by Damian Tabański on 27/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import Foundation

class ExperiencePresenter {
    
    var view: ExperienceViewing?
    
}

extension ExperiencePresenter: ResumeSetting {
    
    func setResume(_ resume: Resume) {
        let cellViewModels = resume.experience.map {
            CellViewModel(companyExperience: $0)
        }
        
        let viewModel = ExperienceViewModel(cellViewModels: cellViewModels)
        view?.update(viewModel: viewModel)
    }
    
}

extension CellViewModel {
    init(companyExperience: CompanyExperience) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM.yyyy"
        
        let datesText = "\(dateFormatter.string(from: companyExperience.dateFrom)) - \(dateFormatter.string(from: companyExperience.dateTo))"
        
        self.init(
            title: "\(companyExperience.companyName)\n\(companyExperience.role)",
            subtitle: datesText,
            image: .init(type: .url(string: companyExperience.companyLogoUrlString), size: Size(width: 80, height: 80)),
            selectable: false)
    }
}
