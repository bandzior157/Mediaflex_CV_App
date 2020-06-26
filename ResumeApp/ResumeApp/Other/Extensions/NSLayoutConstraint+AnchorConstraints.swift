//
//  NSLayo.swift
//  ResumeApp
//
//  Created by Damian Tabański on 24/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import UIKit

extension NSLayoutConstraint {
    
    static func anchorConstraints(view: UIView, in layoutGuide: UILayoutGuide, margins: Margins) -> [NSLayoutConstraint] {
        [view.topAnchor.constraint(equalTo: layoutGuide.topAnchor, constant: margins.top),
         view.leftAnchor.constraint(equalTo: layoutGuide.leftAnchor, constant: margins.left),
         view.rightAnchor.constraint(equalTo: layoutGuide.rightAnchor, constant: -margins.right),
         view.bottomAnchor.constraint(equalTo: layoutGuide.bottomAnchor, constant: -margins.bottom)]
    }
    
}
