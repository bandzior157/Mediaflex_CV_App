//
//  UITableViewCell+CellStyle.swift
//  Mediaflex_CV_AppTests
//
//  Created by Damian Tabański on 25/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import UIKit

extension UITableViewCell {
    
    var cellStyle: UITableViewCell.CellStyle? {
        let rawValue = value(forKey: "cellStyle") as! Int
        return UITableViewCell.CellStyle(rawValue: rawValue)
    }
    
}
