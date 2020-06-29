//
//  Router.swift
//  ResumeApp
//
//  Created by Damian Tabański on 29/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import UIKit

class Router: Routing {
    
    private let viewController: UIViewController
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    func show(companyExperience: CompanyExperience) {
        let uv = CompanyExperienceDetailViewController()
        viewController.present(uv, animated: true)
    }
    
}
