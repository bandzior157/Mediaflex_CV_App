//
//  CellPresentableModel.swift
//  ResumeApp
//
//  Created by Łukasz Bazior on 24/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

struct CellPresentableModel {
    
    let title: String
    let subtitle: String?
    let selectable: Bool
    let imagePresentableModel: ImagePresentableModel?
    
    init(title: String = "", subtitle: String? = nil, image imagePresentableModel: ImagePresentableModel? = nil, selectable: Bool = false) {
        self.title = title
        self.subtitle = subtitle
        self.selectable = selectable
        self.imagePresentableModel = imagePresentableModel
    }
    
}
