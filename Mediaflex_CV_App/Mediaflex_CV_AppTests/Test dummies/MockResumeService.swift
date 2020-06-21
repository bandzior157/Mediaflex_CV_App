//
//  MockResumeService.swift
//  Mediaflex_CV_AppTests
//
//  Created by Łukasz Bazior on 21/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

@testable import Mediaflex_CV_App

class MockResumeService: ResumeServicing {
    
    private(set) var fetchResumeCounter = 0
    
    func fetchResume() {
        fetchResumeCounter += 1
    }
    
}
