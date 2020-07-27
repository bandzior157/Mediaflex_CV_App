//
//  CompanyExperienceDetailContract.swift
//  ResumeApp
//
//  Created by Łukasz Bazior on 29/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

protocol CompanyExperienceDetailViewing {
    func update(viewModel: CompanyExperienceDetailPresentableModel)
}

protocol CompanyExperienceDetailPresenting {
    func viewDidLoad()
}
