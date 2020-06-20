//
//  MockGeneralViewController.swift
//  Mediaflex_CV_AppTests
//
//  Created by Łukasz Bazior on 20/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import UIKit
@testable import Mediaflex_CV_App

class MockGeneralViewController: UIViewController, GeneralViewing {
    private(set) var updateViewModels = [GeneralViewModel]()
    
    func update(viewModel: GeneralViewModel) {
        updateViewModels.append(viewModel)
    }
}
