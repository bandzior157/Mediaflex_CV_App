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
        
        if let imageName = viewModel.imageName {
            imageView?.image = UIImage(named: imageName)?.resized(toWidth: 40)?.withRenderingMode(.alwaysTemplate)
        }
        
        if let imageUrlString = viewModel.imageUrlString {
            imageView?.setImage(at: imageUrlString)
        }
        
        imageView?.tintColor = .systemTeal
        
        selectionStyle = viewModel.selectable ? .default : .none
        
        accessoryType = viewModel.selectable ? .disclosureIndicator : .none
    }
    
}
