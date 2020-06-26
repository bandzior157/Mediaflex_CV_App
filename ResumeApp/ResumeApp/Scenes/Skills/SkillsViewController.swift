//
//  SkillsViewController.swift
//  ResumeApp
//
//  Created by Damian Tabański on 24/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import UIKit

class SkillsViewController: UIViewController {
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.removeTrailingSeparators()
        return tableView
    }()
    
    private var viewModel: SkillsViewModel? {
        didSet {
            reloadSubviews()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
    }
    
    private func setupSubviews() {
        view.addSubview(tableView)
        layoutTableView()
    }
    
    private func layoutTableView() {
        let constraints = NSLayoutConstraint.anchorConstraints(view: tableView, in: view.safeAreaLayoutGuide, margins: Margins.init(vertical: 0, horizontal: 0))
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(constraints)
    }
    
    private func reloadSubviews() {
        ThreadGuarantee.guarantee(on: .main) { [weak self] in
            self?.tableView.reloadData()
        }
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
    
}

extension SkillsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = TableViewHeaderView()
        view.update(title: viewModel?.sections[section].title)
        return view
    }
    
}
