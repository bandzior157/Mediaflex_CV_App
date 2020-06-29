//
//  CompanyExperienceDetailViewController.swift
//  ResumeApp
//
//  Created by Damian Tabański on 29/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import UIKit

class CompanyExperienceDetailViewController: UIViewController {
    
    private(set) var headerView = CompanyExperienceHeaderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .orange
    }
    
}


extension CompanyExperienceDetailViewController: CompanyExperienceDetailViewing {
    
    func update(viewModel: CompanyExperienceDetailViewModel) {
        headerView.companyLabel.text = viewModel.companyName
        headerView.companyLogo.setImage(at: viewModel.companyLogoUrlString)
        headerView.roleLabel.text = viewModel.role
    }
    
}
