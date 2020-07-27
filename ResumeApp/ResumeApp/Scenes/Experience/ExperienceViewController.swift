//
//  ExperienceViewController.swift
//  ResumeApp
//
//  Created by Łukasz Bazior on 27/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import UIKit

class ExperienceViewController: UIViewController {
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.removeTrailingSeparators()
        return tableView
    }()
    
    private var viewModel: ExperiencePresentableModel? {
        didSet {
            reloadSubviews()
        }
    }
    
    var presenter: ExperiencePresenting?
    
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
        let constraints = NSLayoutConstraint.anchorConstraints(view: tableView, in: view.safeAreaLayoutGuide)
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
    
    func update(viewModel: ExperiencePresentableModel) {
        self.viewModel = viewModel
    }
    
}

extension ExperienceViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter?.didSelect(row: indexPath.row)
    }
    
}
