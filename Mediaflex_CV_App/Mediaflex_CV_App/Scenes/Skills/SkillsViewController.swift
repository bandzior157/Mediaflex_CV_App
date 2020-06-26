//
//  SkillsViewController.swift
//  Mediaflex_CV_App
//
//  Created by Damian Tabański on 24/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import UIKit

class SkillsViewController: UIViewController {
    
    var tableView = UITableView()
    
    private var viewModel: SkillsViewModel? {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemTeal

        setupNavigationBar()
        setupTabBar()
        setupSubviews()
    }
    
    private func setupNavigationBar() {
        guard let navigationBar = navigationController?.navigationBar else { return }
        navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.label]
        navigationBar.prefersLargeTitles = true
        navigationBar.backgroundColor = .systemTeal
        navigationBar.barTintColor = .systemTeal
        navigationBar.isTranslucent = true
    }
    
    private func setupTabBar() {
        navigationController?.tabBarController?.tabBar.backgroundColor = .systemBackground
    }
    
    private func setupSubviews() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.removeTrailingSeparators()
        view.addSubview(tableView)
        layoutTableView()
    }
    
    private func layoutTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(NSLayoutConstraint.anchorConstraints(view: tableView, in: view.safeAreaLayoutGuide, margins: Margins.init(vertical: 0, horizontal: 0)))
    }
    
}

extension SkillsViewController: SkillsViewing {
    
    func update(viewModel: SkillsViewModel) {
        self.viewModel = viewModel
    }
    
}

extension SkillsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let section = viewModel?.sections[section] else { return 0 }
        return section.elements.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        guard let cellViewModel = viewModel?.sections[indexPath.section].elements[indexPath.row] else {
            return cell
        }
        cell.update(viewModel: cellViewModel)
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        viewModel?.sections.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = TableViewHeaderView()
        view.textLabel.text = viewModel?.sections[section].title
        return view
    }
    
}

extension SkillsViewController: UITableViewDelegate {
    
}
