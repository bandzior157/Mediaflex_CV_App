//
//  WeakRef+CompanyExperienceDetailViewing.swift
//  ResumeApp
//
//  Created by Łukasz Bazior on 29/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

extension WeakRef: CompanyExperienceDetailViewing where T: CompanyExperienceDetailViewing {
    
    func update(viewModel: CompanyExperienceDetailPresentableModel) {
        object?.update(viewModel: viewModel)
    }
    
}
