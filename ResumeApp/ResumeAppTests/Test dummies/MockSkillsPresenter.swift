//
//  MockSkillsPresenter.swift
//  ResumeAppTests
//
//  Created by Damian Tabański on 25/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

@testable import ResumeApp

class MockSkillsPresenter: SkillsPresenting {
    
    private(set) var resumes = [Resume]()

    func setResume(_ resume: Resume) {
        resumes.append(resume)
    }
    
}
