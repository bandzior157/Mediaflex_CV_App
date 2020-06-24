//
//  GeneralPresenter.swift
//  Mediaflex_CV_App
//
//  Created by Damian Tabański on 24/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

class GeneralPresenter: GeneralPresenting {
    
    var view: GeneralViewing?
    
    func setResume(_ resume: Resume) {
        view?.update(viewModel: GeneralViewModel(resume: resume))
    }
    
}
