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
    let selectable: Bool
    let imageViewModel: ImageViewModel?
    
    init(title: String = "", subtitle: String? = nil, imageName: String? = nil, imageUrlString: String? = nil, selectable: Bool = false) {
        self.title = title
        self.subtitle = subtitle
        self.selectable = selectable
        
        let size = Size(width: 40, height: 40)
        if let imageName = imageName {
            self.imageViewModel = ImageViewModel(type: .named(imageName: imageName), size: size)
        } else if let imageUrlString = imageUrlString {
            self.imageViewModel = ImageViewModel(type: .url(string: imageUrlString), size: size)
        } else {
            self.imageViewModel = nil
        }
    }
    
}
