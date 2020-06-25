//
//  MockGeneralPresenter.swift
//  Mediaflex_CV_AppTests
//
//  Created by Damian Tabański on 25/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

@testable import Mediaflex_CV_App

class MockGeneralPresenter: GeneralPresenting {
    
    private(set) var resumes = [Resume]()

    func setResume(_ resume: Resume) {
        resumes.append(resume)
    }
    
}
