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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupSubviews()
    }
    
    private func setupSubviews() {
        view.addSubview(personView)
        view.bringSubviewToFront(personView)

        layoutSubviews()
    }
    
    private func layoutSubviews() {
        let layoutGuide = view.safeAreaLayoutGuide
        
        let constraints = [
            personView.topAnchor.constraint(equalTo: layoutGuide.topAnchor, constant: 0),
            personView.leftAnchor.constraint(equalTo: layoutGuide.leftAnchor, constant: 0),
            personView.rightAnchor.constraint(equalTo: layoutGuide.rightAnchor, constant: -0),
            personView.bottomAnchor.constraint(lessThanOrEqualTo: layoutGuide.bottomAnchor, constant: -0)
        ]
        
        personView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(constraints)
    }
        
}

extension GeneralViewController: GeneralViewing {
    
    func update(viewModel: GeneralViewModel) {
        personView.nameLabel.text = viewModel.name
        personView.roleLabel.text = viewModel.role
        personView.imageView.setImage(at: viewModel.imageUrl)
    }
    
}
