//
//  CellViewModel.swift
//  ResumeApp
//
//  Created by Damian Tabański on 24/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

struct CellViewModel {
    
    let title: String
    let subtitle: String?
    let imageName: String?
    let selectable: Bool
    
    init(title: String = "", subtitle: String? = nil, imageName: String? = nil, selectable: Bool = false) {
        self.title = title
        self.subtitle = subtitle
        self.imageName = imageName
        self.selectable = selectable
    }
    
}
