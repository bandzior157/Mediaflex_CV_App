//
//  CompanyExperienceDetailViewController.swift
//  ResumeApp
//
//  Created by Łukasz Bazior on 29/06/2020.
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
        tableView.removeTrailingSeparators()
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    
    var presenter: CompanyExperienceDetailPresenting?
    
    private(set) var sections = [SectionPresentableModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        configureSubviews()
        presenter?.viewDidLoad()
    }
    
    private func configureSubviews() {
        tableView.removeTrailingSeparators()

        let stackView = UIStackView(arrangedSubviews: [headerView, tableView])
        stackView.alignment = .fill
        stackView.axis = .vertical
        stackView.spacing = 0
        
        view.addSubview(stackView)
        
        let stackViewConstraints = NSLayoutConstraint.anchorConstraints(view: stackView, in: view.safeAreaLayoutGuide)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(stackViewConstraints)
    }
    
}

extension CompanyExperienceDetailViewController: CompanyExperienceDetailViewing {
    
    func update(viewModel: CompanyExperienceDetailPresentableModel) {
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

extension CompanyExperienceDetailViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = TableViewHeaderView()
        view.update(title: sections[section].title)
        return view
    }
    
}
