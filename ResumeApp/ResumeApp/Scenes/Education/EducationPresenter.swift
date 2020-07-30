//
//  EducationPresenter.swift
//  ResumeApp
//
//  Created by Łukasz Bazior on 29/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

class EducationPresenter {
    
    var view: EducationViewing?
    
}

extension EducationPresenter: ResumeSetting {
    
    func setResume(_ resume: Resume) {
        view?.update(presentableModel: EducationPresentableModel(resume: resume))
    }
    
}
