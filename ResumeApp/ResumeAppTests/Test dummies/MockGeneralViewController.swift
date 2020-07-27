//
//  MockGeneralViewController.swift
//  ResumeAppTests
//
//  Created by Łukasz Bazior on 20/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import UIKit
@testable import ResumeApp

class MockGeneralViewController: UIViewController, GeneralViewing {
    
    private(set) var updateViewModels = [GeneralPresentableModel]()
    
    func update(viewModel: GeneralPresentableModel) {
        updateViewModels.append(viewModel)
    }
    
}
