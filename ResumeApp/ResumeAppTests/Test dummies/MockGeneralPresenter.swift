//
//  MockGeneralPresenter.swift
//  ResumeAppTests
//
//  Created by Łukasz Bazior on 25/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

@testable import ResumeApp

class MockGeneralPresenter: GeneralPresenting {
    
    private(set) var resumes = [Resume]()

    func setResume(_ resume: Resume) {
        resumes.append(resume)
    }
    
    private(set) var selectedRows = [Int]()
    
    func didSelect(row: Int) {
        selectedRows.append(row)
    }
     
}
