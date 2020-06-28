//
//  ExperienceViewController.swift
//  ResumeApp
//
//  Created by Damian Tabański on 27/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import UIKit

class ExperienceViewController: UIViewController {
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        return tableView
    }()
    
    private var viewModel: ExperienceViewModel? {
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
        layoutSubviews()
    }
    
    private func layoutSubviews() {
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

extension ExperienceViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel?.cellViewModels.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)

        guard let cellViewModel = viewModel?.cellViewModels[indexPath.row] else {
            return cell
        }
        
        cell.update(viewModel: cellViewModel)
        return cell
    }
    
}

extension ExperienceViewController: ExperienceViewing {
    
    func update(viewModel: ExperienceViewModel) {
        self.viewModel = viewModel
    }
    
}
