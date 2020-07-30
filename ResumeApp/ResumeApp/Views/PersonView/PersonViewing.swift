//
//  PersonViewing.swift
//  ResumeApp
//
//  Created by Łukasz Bazior on 24/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

protocol PersonViewing {
    func update(presentableModel: PersonViewPresentableModel)
}

extension PersonView: PersonViewing {
    
    func update(presentableModel: PersonViewPresentableModel) {
        nameLabel.text = presentableModel.fullName
        roleLabel.text = presentableModel.role
        
        imageView.setImage(imagePresentableModel: presentableModel.image)
        
        setLabelsVisible(true)
    }
    
}
