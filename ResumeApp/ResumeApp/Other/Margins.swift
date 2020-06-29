//
//  Margins.swift
//  ResumeApp
//
//  Created by Łukasz Bazior on 22/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import UIKit

struct Margins {
    private(set) var top: CGFloat
    private(set) var bottom: CGFloat
    private(set) var left: CGFloat
    private(set) var right: CGFloat
    
    init(vertical: Float, horizontal: Float) {
        let vert = CGFloat(vertical)
        let hori = CGFloat(horizontal)
        
        top = vert
        bottom = vert
        left = hori
        right = hori
    }
}

extension Margins {
    static var zero = Margins(vertical: 0, horizontal: 0)
}
