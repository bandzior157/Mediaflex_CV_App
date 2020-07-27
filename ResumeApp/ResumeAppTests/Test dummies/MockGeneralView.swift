//
//  MockGeneralView.swift
//  ResumeAppTests
//
//  Created by Łukasz Bazior on 26/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

@testable import ResumeApp

class MockGeneralView: GeneralViewing {
    
    private(set) var updateViewModels = [GeneralPresentableModel]()
    
    func update(viewModel: GeneralPresentableModel) {
        updateViewModels.append(viewModel)
    }
    
}
