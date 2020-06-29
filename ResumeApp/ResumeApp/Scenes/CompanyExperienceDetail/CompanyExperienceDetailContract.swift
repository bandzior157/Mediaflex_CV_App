//
//  CompanyExperienceDetailContract.swift
//  ResumeApp
//
//  Created by Damian Tabański on 29/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

protocol CompanyExperienceDetailViewing {
    func update(viewModel: CompanyExperienceDetailViewModel)
}

protocol CompanyExperienceDetailPresenting {
    func viewDidLoad()
}
