//
//  CGSize+InitSize.swift
//  ResumeApp
//
//  Created by Łukasz Bazior on 28/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import UIKit

extension CGSize {
    
    init(size: Size) {
        self.init(width: size.width, height: size.height)
    }
    
}
