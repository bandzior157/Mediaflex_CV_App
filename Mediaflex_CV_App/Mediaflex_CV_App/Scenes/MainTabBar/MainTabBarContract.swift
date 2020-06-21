//
//  MainTabBarContract.swift
//  Mediaflex_CV_App
//
//  Created by Łukasz Bazior on 19/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

protocol MainTabBarPresenting {
    func viewDidLoad()
}

struct MainTabBarViewModel {
    let general: GeneralViewModel
}

struct GeneralViewModel {
    let name: String
    let role: String
    let summary: String
    let email: String
    let phone: String
    let linkedIn: String
    let github: String
}

protocol GeneralViewing {
    func update(viewModel: GeneralViewModel)
}
