//
//  MockMainTabBarPresenter.swift
//  Mediaflex_CV_AppTests
//
//  Created by Łukasz Bazior on 20/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

@testable import Mediaflex_CV_App

class MockMainTabBarPresenter: MainTabBarPresenting {
    
    private(set) var viewDidLoadCounter = 0
    
    func viewDidLoad() {
        viewDidLoadCounter += 1
    }
    
}
