//
//  MockResumeTabBarPresenter.swift
//  ResumeAppTests
//
//  Created by Łukasz Bazior on 20/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

@testable import ResumeApp

class MockResumeTabBarPresenter: ResumeTabBarPresenting {
    
    private(set) var viewDidLoadCounter = 0
    
    func viewDidLoad() {
        viewDidLoadCounter += 1
    }
    
}
