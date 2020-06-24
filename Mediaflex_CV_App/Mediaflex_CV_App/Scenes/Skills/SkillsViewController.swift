//
//  SkillsViewController.swift
//  Mediaflex_CV_App
//
//  Created by Damian Tabański on 24/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import UIKit

class SkillsViewController: UITableViewController {
    
    private var viewModel: SkillsViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.label]
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}

extension SkillsViewController: SkillsViewing {
    
    func update(viewModel: SkillsViewModel) {
        self.viewModel = viewModel
    }
    
}
