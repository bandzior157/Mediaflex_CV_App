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
        
        setImage(imageViewModel: viewModel.imageViewModel)
        
        imageView?.tintColor = .systemTeal

        selectionStyle = viewModel.selectable ? .default : .none
        
        accessoryType = viewModel.selectable ? .disclosureIndicator : .none
    }
    
    private func setImage(imageViewModel: ImageViewModel?) {
        guard let imageViewModel = imageViewModel else {
            imageView?.image = nil
            return
        }
        
        let size = CGSize(size: imageViewModel.size)
        
        switch imageViewModel.type {
        case let .named(imageName):
            setImage(named: imageName, size: size)
        case let .url(urlString):
            setImage(urlString: urlString, size: size)
        }
    }
    
    private func setImage(named imageName: String, size: CGSize) {
        imageView?.image = UIImage(named: imageName)?
        .resized(to: size)
        .withRenderingMode(.alwaysTemplate)
    }
    
    private func setImage(urlString: String, size: CGSize) {
        configureImageViewAsPlaceholder(true)

        imageView?.sd_setImage(with: URL(string: urlString), placeholderImage: getPlaceholderImage(size: size), completed: { [weak self] (image, _, _, _) in
            ThreadGuarantee.guarantee(on: .main) {
                guard let image = image else { return }
                
                self?.imageView?.image = image.resized(to: size)
                self?.configureImageViewAsPlaceholder(false)
            }
        })
    }
    
    private func getPlaceholderImage(size: CGSize) -> UIImage? {
        UIImage(color: .secondarySystemBackground, size: size)
    }
    
    private func configureImageViewAsPlaceholder(_ isPlaceholder: Bool) {
        imageView?.layer.cornerRadius = isPlaceholder ? 8 : 0
        imageView?.clipsToBounds = isPlaceholder
    }
    
}
