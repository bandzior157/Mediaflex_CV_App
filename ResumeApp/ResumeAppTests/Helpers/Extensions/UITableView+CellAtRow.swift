//
//  UITableView+CellAtRow.swift
//  ResumeAppTests
//
//  Created by Łukasz Bazior on 25/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import UIKit

extension UITableView {
    
    func cell(at row: Int) -> UITableViewCell? {
        cellForRow(at: IndexPath(row: row, section: 0))
    }
    
}
