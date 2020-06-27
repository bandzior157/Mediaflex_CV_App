//
//  UITableViewCell+CellViewModelUpdating.swift
//  ResumeApp
//
//  Created by Damian Tabański on 24/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import UIKit

extension UITableViewCell: CellViewModelUpdating {
    
    func update(viewModel: CellViewModel) {
        textLabel?.numberOfLines = 0
        textLabel?.text = viewModel.title
        
        detailTextLabel?.numberOfLines = 0
        detailTextLabel?.textColor = .secondaryLabel
        detailTextLabel?.text = viewModel.subtitle
        
        imageView?.image = UIImage(named: viewModel.imageName ?? "")?.resized(toWidth: 40)?.withRenderingMode(.alwaysTemplate)
        imageView?.tintColor = .systemTeal
        
        selectionStyle = viewModel.selectable ? .default : .none
        
        accessoryType = viewModel.selectable ? .disclosureIndicator : .none
    }
    
}
