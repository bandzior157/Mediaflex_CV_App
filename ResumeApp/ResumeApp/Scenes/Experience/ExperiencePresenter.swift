//
//  ExperiencePresenter.swift
//  ResumeApp
//
//  Created by Damian Tabański on 27/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

class ExperiencePresenter {
    
    var view: ExperienceViewing?
    
}

extension ExperiencePresenter: ResumeSetting {
    
    func setResume(_ resume: Resume) {
        let cellViewModels = resume.experience.map {
            CellViewModel(
                title: "\($0.companyName)\n\($0.role)",
                image: .init(type: .url(string: $0.companyLogoUrlString), size: Size(width: 80, height: 80)),
                selectable: false)
        }
        
        let viewModel = ExperienceViewModel(cellViewModels: cellViewModels)
        view?.update(viewModel: viewModel)
    }
    
}
