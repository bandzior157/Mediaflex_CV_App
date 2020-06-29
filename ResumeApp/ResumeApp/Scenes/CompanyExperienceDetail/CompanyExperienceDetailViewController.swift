//
//  CompanyExperienceDetailViewController.swift
//  ResumeApp
//
//  Created by Damian Tabański on 29/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import UIKit

class CompanyExperienceDetailViewController: UIViewController {
    
    private(set) lazy var headerView: CompanyExperienceHeaderView = {
        let view = CompanyExperienceHeaderView()
        view.backgroundColor = .systemTeal
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .orange
        configureSubviews()
    }
    
    private func configureSubviews() {
        addSubviews()
        layoutSubviews()
    }
    
    private func addSubviews() {
        view.addSubview(headerView)
    }
    
    private func layoutSubviews() {
        let layoutGuide = view.safeAreaLayoutGuide
        
        let headerViewConstraints = [
            headerView.topAnchor.constraint(equalTo: view.topAnchor),
            headerView.leftAnchor.constraint(equalTo: layoutGuide.leftAnchor),
            headerView.rightAnchor.constraint(equalTo: layoutGuide.rightAnchor),
            headerView.bottomAnchor.constraint(lessThanOrEqualTo: layoutGuide.bottomAnchor)
        ]
        
        headerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(headerViewConstraints)
    }
    
}


extension CompanyExperienceDetailViewController: CompanyExperienceDetailViewing {
    
    func update(viewModel: CompanyExperienceDetailViewModel) {
        headerView.companyLabel.text = viewModel.companyName
        headerView.imageView.setImage(at: viewModel.companyLogoUrlString)
        headerView.roleLabel.text = viewModel.role
    }
    
}
