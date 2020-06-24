//
//  GeneralViewController.swift
//  Mediaflex_CV_App
//
//  Created by Łukasz Bazior on 19/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import UIKit

class GeneralViewController: UIViewController {
    
    var personView = PersonView()
    var tableView = UITableView()
    
    private var viewModel: GeneralViewModel? {
        didSet {
            tableView.reloadData()
            
            guard let viewModel = viewModel else { return }
            personView.nameLabel.text = viewModel.name
            personView.roleLabel.text = viewModel.role
            personView.imageView.setImage(at: viewModel.imageUrl)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        tableView.dataSource = self
        tableView.delegate = self
        setupSubviews()
    }
    
    private func setupSubviews() {
        view.addSubview(personView)
        view.bringSubviewToFront(personView)
        view.addSubview(tableView)
        layoutSubviews()
    }
    
    private func layoutSubviews() {
        let layoutGuide = view.safeAreaLayoutGuide
        
        let personViewConstraints = [
            personView.topAnchor.constraint(equalTo: layoutGuide.topAnchor),
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
        
}

extension GeneralViewController: GeneralViewing {
    
    func update(viewModel: GeneralViewModel) {
        self.viewModel = viewModel
    }
    
}

extension GeneralViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = viewModel?.elements[indexPath.row].title
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel?.elements.count ?? 0
    }
    
}

extension GeneralViewController: UITableViewDelegate {
    
}
