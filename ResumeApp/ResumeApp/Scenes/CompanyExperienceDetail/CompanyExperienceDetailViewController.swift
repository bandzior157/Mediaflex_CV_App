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
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        return tableView
    }()
    
    var presenter: CompanyExperienceDetailPresenting?
    
    private(set) var sections = [SectionViewModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        configureSubviews()
        presenter?.viewDidLoad()
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
        headerView.update(viewModel: CompanyExperienceHeaderViewModel(viewModel: viewModel))
        sections = viewModel.sections
    }
    
}

extension CompanyExperienceDetailViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sections[section].elements.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        cell.update(viewModel: sections[indexPath.section].elements[indexPath.row])
        return cell
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        sections.count
    }
    
}
