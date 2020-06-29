//
//  Router.swift
//  ResumeApp
//
//  Created by Damian Tabański on 29/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import UIKit

class Router {
    
    private let viewController: UIViewController
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
}

extension Router: Routing {
    
    func show(companyExperience: CompanyExperience) {
        let vc = makeCompanyExperienceDetailViewController(for: companyExperience)
        viewController.present(vc, animated: true)
    }
    
    private func makeCompanyExperienceDetailViewController(for companyExperience: CompanyExperience) -> CompanyExperienceDetailViewController {
        let vc = CompanyExperienceDetailViewController()
        let presenter = CompanyExperienceDetailPresenter(companyExperience: companyExperience)
        vc.presenter = presenter
        presenter.view = vc
        return vc
    }
    
}
