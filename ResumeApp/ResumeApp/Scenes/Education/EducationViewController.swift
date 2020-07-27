//
//  EducationViewController.swift
//  ResumeApp
//
//  Created by Łukasz Bazior on 29/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import UIKit

class EducationViewController: UIViewController {
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.removeTrailingSeparators()
        return tableView
    }()
    
    private var viewModel: EducationPresentableModel? {
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

extension EducationViewController: EducationViewing {
    
    func update(viewModel: EducationPresentableModel) {
        self.viewModel = viewModel
    }
    
}

extension EducationViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel?.cellViewModels.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        guard let viewModel = viewModel?.cellViewModels[indexPath.row] else { return cell }
        cell.update(viewModel: viewModel)
        return cell
    }
    
}
