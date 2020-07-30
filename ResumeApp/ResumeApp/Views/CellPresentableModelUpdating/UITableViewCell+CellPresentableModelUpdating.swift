//
//  UITableViewCell+CellPresentableModelUpdating.swift
//  ResumeApp
//
//  Created by Łukasz Bazior on 24/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import UIKit

extension UITableViewCell: CellPresentableModelUpdating {
        
    func update(presentableModel: CellPresentableModel) {
        textLabel?.numberOfLines = 0
        textLabel?.text = presentableModel.title
        
        detailTextLabel?.numberOfLines = 0
        detailTextLabel?.textColor = .secondaryLabel
        detailTextLabel?.text = presentableModel.subtitle
        
        imageView?.setImage(imagePresentableModel: presentableModel.imagePresentableModel)
        imageView?.tintColor = .systemTeal

        selectionStyle = presentableModel.selectable ? .default : .none
        
        accessoryType = presentableModel.selectable ? .disclosureIndicator : .none
    }

}
