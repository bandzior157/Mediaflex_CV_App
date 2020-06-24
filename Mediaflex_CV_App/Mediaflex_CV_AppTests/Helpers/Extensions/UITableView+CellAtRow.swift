//
//  UITableView+CellAtRow.swift
//  Mediaflex_CV_AppTests
//
//  Created by Damian Tabański on 25/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import UIKit

extension UITableView {
    
    func cell(at row: Int) -> UITableViewCell? {
        cellForRow(at: IndexPath(row: row, section: 0))
    }
    
}
