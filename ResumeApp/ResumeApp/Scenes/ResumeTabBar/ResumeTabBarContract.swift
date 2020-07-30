//
//  ResumeTabBarContract.swift
//  ResumeApp
//
//  Created by Łukasz Bazior on 19/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

protocol ResumeTabBarPresenting {
    func viewDidLoad()
}

#warning("needless?")
struct ResumeTabBarPresentableModel {
    let general: GeneralPresentableModel
}
