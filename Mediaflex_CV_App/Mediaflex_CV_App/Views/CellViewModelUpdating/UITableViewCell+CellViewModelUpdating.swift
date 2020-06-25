//
//  UITableViewCell+CellViewModelUpdating.swift
//  Mediaflex_CV_App
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
        
        imageView?.image = UIImage(named: viewModel.imageName ?? "")?.resized(toWidth: 30)?.withRenderingMode(.alwaysTemplate)
        imageView?.tintColor = .label
        
        selectionStyle = SelectionStyleProvider.enabled(viewModel.selectable)
    }
}

class SelectionStyleProvider {
    static func enabled(_ enabled: Bool) -> UITableViewCell.SelectionStyle {
        enabled ? .default : .none
    }
}
