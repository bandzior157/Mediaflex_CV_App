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
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM.yyyy"
        
        let cellViewModels = resume.experience.map {
            CellViewModel(
                title: "\($0.companyName)\n\($0.role)",
                subtitle: "\(dateFormatter.string(from: $0.dateFrom)) - \(dateFormatter.string(from: $0.dateTo))",
                image: .init(type: .url(string: $0.companyLogoUrlString), size: Size(width: 80, height: 80)),
                selectable: false)
        }
        
        let viewModel = ExperienceViewModel(cellViewModels: cellViewModels)
        view?.update(viewModel: viewModel)
    }
    
}
