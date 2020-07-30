//
//  ExperienceContract.swift
//  ResumeApp
//
//  Created by Łukasz Bazior on 27/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

protocol ExperienceViewing {
    func update(presentableModel: ExperiencePresentableModel)
}

protocol ExperiencePresenting {
    func didSelect(row: Int)
}

protocol Routing {
    func show(companyExperience: CompanyExperience)
}
