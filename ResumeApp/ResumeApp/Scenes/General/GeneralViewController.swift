//
//  GeneralViewController.swift
//  ResumeApp
//
//  Created by Łukasz Bazior on 19/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import UIKit

class GeneralViewController: UIViewController {
    
    lazy var personView: PersonView = {
        let personView = PersonView()
        personView.backgroundColor = .systemTeal
        return personView
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.removeTrailingSeparators()
        return tableView
    }()
        
    var presenter: GeneralPresenting?
    
    private var presentableModel: GeneralPresentableModel? {
        didSet {
            reloadSubviews()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupSubviews()
    }
    
    private func setupSubviews() {
        view.addSubviews(personView, tableView)
        layoutSubviews()
    }
    
    private func layoutSubviews() {
        let layoutGuide = view.safeAreaLayoutGuide
        
        let personViewConstraints = [
            personView.topAnchor.constraint(equalTo: view.topAnchor),
            personView.leftAnchor.constraint(equalTo: layoutGuide.leftAnchor),
            personView.rightAnchor.constraint(equalTo: layoutGuide.rightAnchor),
            personView.bottomAnchor.constraint(lessThanOrEqualTo: layoutGuide.bottomAnchor)
        ]
        
        let tableViewConstraints = [
            tableView.topAnchor.constraint(equalTo: personView.bottomAnchor),
            tableView.leftAnchor.constraint(equalTo: layoutGuide.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: layoutGuide.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: layoutGuide.bottomAnchor)
        ]
        
        personView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(personViewConstraints)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(tableViewConstraints)
    }
        
    private func reloadSubviews() {
        ThreadGuarantee.guarantee(on: .main) { [weak self] in
            self?.tableView.reloadData()
            
            guard let presentableModel = self?.presentableModel else { return }
            self?.personView.update(presentableModel: presentableModel.personViewPresentableModel)
        }
    }
}

extension GeneralViewController: GeneralViewing {
    
    func update(presentableModel: GeneralPresentableModel) {
        self.presentableModel = presentableModel
    }
    
}

extension GeneralViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)

        guard let cellPresentableModel = presentableModel?.elements[indexPath.row] else {
            return cell
        }

        cell.update(presentableModel: cellPresentableModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presentableModel?.elements.count ?? 0
    }
    
}

extension GeneralViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter?.didSelect(row: indexPath.row)
    }
    
}
