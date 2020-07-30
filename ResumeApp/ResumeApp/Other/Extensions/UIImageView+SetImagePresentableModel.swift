//
//  UIImageView+SetImagePresentableModel.swift
//  ResumeApp
//
//  Created by Łukasz Bazior on 29/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import UIKit
import SDWebImage

extension UIImageView {
    
    func setImage(imagePresentableModel: ImagePresentableModel?) {
        guard let imagePresentableModel = imagePresentableModel else {
            image = nil
            return
        }
        
        let size = CGSize(size: imagePresentableModel.size)
        
        switch imagePresentableModel.type {
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
        clipsToBounds = true

        sd_setImage(with: URL(string: urlString), placeholderImage: getPlaceholderImage(size: size), completed: { [weak self] (image, _, _, _) in
            ThreadGuarantee.guarantee(on: .main) { [weak self] in
                guard let image = image else { return }
                self?.image = image.resized(to: size)
            }
        })
    }
    
    private func getPlaceholderImage(size: CGSize) -> UIImage? {
        UIImage(color: .secondarySystemBackground, size: size)
    }
    
}
