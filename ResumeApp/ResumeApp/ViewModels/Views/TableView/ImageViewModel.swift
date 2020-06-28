//
//  ImageViewModel.swift
//  ResumeApp
//
//  Created by Damian Tabański on 28/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

struct ImageViewModel {
    let type: ImageType
    let size: Size
}

enum ImageType {
    case url(string: String)
    case named(imageName: String)
}

struct Size {
    let width: Int
    let height: Int
}
