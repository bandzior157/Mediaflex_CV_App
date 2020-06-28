//
//  UITableViewCell+CellViewModelUpdating.swift
//  ResumeApp
//
//  Created by Damian Tabański on 24/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import UIKit
import SDWebImage

extension UITableViewCell: CellViewModelUpdating {
        
    func update(viewModel: CellViewModel) {
        textLabel?.numberOfLines = 0
        textLabel?.text = viewModel.title
        
        detailTextLabel?.numberOfLines = 0
        detailTextLabel?.textColor = .secondaryLabel
        detailTextLabel?.text = viewModel.subtitle
        
        if let imageName = viewModel.imageName {
            imageView?.image = UIImage(named: imageName)?
                .resized(to: self.getImageSize())
                .withRenderingMode(.alwaysTemplate)
        }
        
        imageView?.tintColor = .systemTeal

        if let imageUrlString = viewModel.imageUrlString {
            configureImageViewAsPlaceholder(true)

            imageView?.sd_setImage(with: URL(string: imageUrlString), placeholderImage: getPlaceholderImage(), completed: { [weak self] (image, _, _, _) in
                ThreadGuarantee.guarantee(on: .main) {
                    guard let size = self?.getImageSize(),
                        let image = image else { return }
                    
                    self?.imageView?.image = image.resized(to: size)
                    self?.configureImageViewAsPlaceholder(false)
                }
            })
        }

        selectionStyle = viewModel.selectable ? .default : .none
        
        accessoryType = viewModel.selectable ? .disclosureIndicator : .none
    }
    
    private func getImageSize() -> CGSize {
        CGSize(width: 40, height: 40)
    }
    
    private func getPlaceholderImage() -> UIImage? {
        UIImage(color: .secondarySystemBackground, size: getImageSize())
    }
    
    private func configureImageViewAsPlaceholder(_ isPlaceholder: Bool) {
        imageView?.layer.cornerRadius = isPlaceholder ? 8 : 0
        imageView?.clipsToBounds = isPlaceholder
    }
    
}
