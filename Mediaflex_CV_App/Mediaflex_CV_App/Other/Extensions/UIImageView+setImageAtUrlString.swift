//
//  UIImageView+setImageAtUrlString.swift
//  Mediaflex_CV_App
//
//  Created by Łukasz Bazior on 22/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import UIKit

extension UIImageView {
    
    func setImage(at urlString: String) {
        guard let url = URL(string: urlString) else { return }
        setImage(at: url)
    }
    
    private func setImage(at url: URL) {
        ThreadGuarantee.guarantee(on: .background) {
            let data = try? Data(contentsOf: url)

            if let data = data {
                ThreadGuarantee.guarantee(on: .main) {
                    self.image = UIImage(data: data)
                }
            }
        }
    }
    
}
