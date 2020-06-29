//
//  UITableViewCell+SelectionStyle.swift
//  ResumeAppTests
//
//  Created by Łukasz Bazior on 25/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import UIKit

extension UITableViewCell {
    
    var selectionStyle: UITableViewCell.SelectionStyle? {
        let rawValue = value(forKey: "selectionStyle") as! Int
        return UITableViewCell.SelectionStyle.init(rawValue: rawValue)
    }
    
}
