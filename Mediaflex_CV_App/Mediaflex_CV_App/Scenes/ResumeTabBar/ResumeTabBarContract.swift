//
//  ResumeTabBarContract.swift
//  Mediaflex_CV_App
//
//  Created by Łukasz Bazior on 19/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

protocol ResumeTabBarPresenting {
    func viewDidLoad()
}

struct ResumeTabBarViewModel {
    let general: GeneralViewModel
}

struct GeneralViewModel {
    let name: String
    let imageUrl: String
    let role: String
    let elements: [CellViewModel]
}

struct CellViewModel {
    let title: String
}
