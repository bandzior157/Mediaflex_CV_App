//
//  UITableView+RemoveTrailingSeparators.swift
//  ResumeApp
//
//  Created by Damian Tabański on 25/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import UIKit

extension UITableView {
    
    func removeTrailingSeparators() {
        tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: 1))
    }
    
}
