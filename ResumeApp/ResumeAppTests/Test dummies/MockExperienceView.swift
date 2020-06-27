//
//  MockExperienceView.swift
//  ResumeAppTests
//
//  Created by Damian Tabański on 27/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

@testable import ResumeApp

class MockExperienceView: ExperienceViewing {
    
    private(set) var updateViewModels = [ExperienceViewModel]()
    
    func update(viewModel: ExperienceViewModel) {
        updateViewModels.append(viewModel)
    }
    
}
