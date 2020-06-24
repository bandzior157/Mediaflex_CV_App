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
    
    private var viewModel: SkillsViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupNavigationBar()
        setupSubviews()
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.label]
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func setupSubviews() {
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
