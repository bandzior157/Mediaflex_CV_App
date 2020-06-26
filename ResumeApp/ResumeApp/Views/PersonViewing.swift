//
//  PersonViewing.swift
//  ResumeApp
//
//  Created by Damian Tabański on 24/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

protocol PersonViewing {
    func update(viewModel: PersonViewViewModel)
}

extension PersonView: PersonViewing {
    func update(viewModel: PersonViewViewModel) {
        nameLabel.text = viewModel.fullName
        roleLabel.text = viewModel.role
        imageView.setImage(at: viewModel.imageUrl)
        
        setLabelsVisible(true)
    }
}
