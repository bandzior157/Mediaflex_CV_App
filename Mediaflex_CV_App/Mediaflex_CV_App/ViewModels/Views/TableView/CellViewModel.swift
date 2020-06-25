//
//  CellViewModel.swift
//  Mediaflex_CV_App
//
//  Created by Damian Tabański on 24/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

struct CellViewModel {
    
    let title: String
    let imageName: String?
    let selectable: Bool
    
    init(title: String = "", imageName: String? = nil, selectable: Bool = false) {
        self.title = title
        self.imageName = imageName
        self.selectable = selectable
    }
    
}
