//
//  SkillsViewController.swift
//  Mediaflex_CV_App
//
//  Created by Damian Tabański on 24/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import UIKit

class SkillsViewController: UIViewController {
    
    var tableView = UITableView()
    
    private var viewModel: SkillsViewModel? {
        didSet {
            title = viewModel?.title
        }
    }
    
}

extension SkillsViewController: SkillsViewing {
    
    func update(viewModel: SkillsViewModel) {
        self.viewModel = viewModel
    }
    
}
