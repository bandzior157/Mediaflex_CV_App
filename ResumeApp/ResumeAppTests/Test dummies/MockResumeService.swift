//
//  MockResumeService.swift
//  ResumeAppTests
//
//  Created by Łukasz Bazior on 21/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

@testable import ResumeApp

class MockResumeService: ResumeServicing {
    
    private(set) var fetchResumeCounter = 0
    
    func fetchResume() {
        fetchResumeCounter += 1
    }
    
}
