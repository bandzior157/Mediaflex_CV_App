//
//  SkillsPresenter.swift
//  ResumeApp
//
//  Created by Łukasz Bazior on 25/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

class SkillsPresenter: SkillsPresenting {
    
    var view: SkillsViewing?
    
    func setResume(_ resume: Resume) {
        view?.update(viewModel: SkillsViewModel(resume: resume))
    }
    
}

extension SkillsPresenter: ResumeSetting {
    
}
