//
//  PersonViewing.swift
//  ResumeApp
//
//  Created by Damian Tabański on 24/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

protocol PersonViewing {
    func update(viewModel: PersonViewViewModel)
}

extension PersonView: PersonViewing {
    
    func update(viewModel: PersonViewViewModel) {
        nameLabel.text = viewModel.fullName
        roleLabel.text = viewModel.role
        
        imageView.setImage(imageViewModel: viewModel.image)
//        imageView.setImage(at: viewModel.imageUrl)
        
        setLabelsVisible(true)
    }
    
}

import UIKit

extension UIImageView {
    
    func setImage(imageViewModel: ImageViewModel?) {
        guard let imageViewModel = imageViewModel else {
            image = nil
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
        image = UIImage(named: imageName)?
        .resized(to: size)
        .withRenderingMode(.alwaysTemplate)
    }
    
    private func setImage(urlString: String, size: CGSize) {
        configureImageViewAsPlaceholder(true)

        sd_setImage(with: URL(string: urlString), placeholderImage: getPlaceholderImage(size: size), completed: { [weak self] (image, _, _, _) in
            ThreadGuarantee.guarantee(on: .main) {
                guard let image = image else { return }
                
                self?.image = image.resized(to: size)
                self?.configureImageViewAsPlaceholder(false)
            }
        })
    }
    
    private func getPlaceholderImage(size: CGSize) -> UIImage? {
        UIImage(color: .secondarySystemBackground, size: size)
    }
    
    private func configureImageViewAsPlaceholder(_ isPlaceholder: Bool) {
        layer.cornerRadius = isPlaceholder ? 8 : 0
        clipsToBounds = isPlaceholder
    }
    
}
