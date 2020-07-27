//
//  MockExperienceView.swift
//  ResumeAppTests
//
//  Created by Łukasz Bazior on 27/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

@testable import ResumeApp

class MockExperienceView: ExperienceViewing {
    
    private(set) var updateViewModels = [ExperiencePresentableModel]()
    
    func update(viewModel: ExperiencePresentableModel) {
        updateViewModels.append(viewModel)
    }
    
}
