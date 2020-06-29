//
//  UITableViewCell+CellStyle.swift
//  ResumeAppTests
//
//  Created by Łukasz Bazior on 25/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import UIKit

extension UITableViewCell {
    
    var cellStyle: UITableViewCell.CellStyle? {
        let rawValue = value(forKey: "cellStyle") as! Int
        return UITableViewCell.CellStyle(rawValue: rawValue)
    }
    
}
