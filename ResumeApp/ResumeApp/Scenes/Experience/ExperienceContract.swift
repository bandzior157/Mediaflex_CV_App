//
//  ExperienceContract.swift
//  ResumeApp
//
//  Created by Damian Tabański on 27/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

protocol ExperienceViewing {
    func update(viewModel: ExperienceViewModel)
}

protocol ExperiencePresenting {
    func didSelect(row: Int)
}

protocol Router {
    func show(companyExperience: CompanyExperience)
}
