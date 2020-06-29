//
//  MockResumeSetter.swift
//  ResumeAppTests
//
//  Created by Łukasz Bazior on 26/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

@testable import ResumeApp

class MockResumeSetter: ResumeSetting {
    
    private(set) var resumes = [Resume]()
    
    func setResume(_ resume: Resume) {
        resumes.append(resume)
    }
    
}
