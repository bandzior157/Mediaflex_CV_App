//
//  UIImage+Resize.swift
//  ResumeApp
//
//  Created by Damian Tabański on 24/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import UIKit

extension UIImage {

    func resized(to size: CGSize) -> UIImage {
        UIGraphicsImageRenderer(size: size).image {_ in
            draw(in: CGRect(origin: .zero, size: size))
        }
    }
    
}
