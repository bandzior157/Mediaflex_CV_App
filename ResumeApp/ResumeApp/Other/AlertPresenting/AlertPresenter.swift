//
//  AlertPresenter.swift
//  ResumeApp
//
//  Created by Łukasz Bazior on 29/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import UIKit

class AlertPresenter: AlertPresenting {
    
    var viewController: UIViewController?
    
    func show(message: String) {
        ThreadGuarantee.guarantee(on: .main) { [weak self] in
            let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)

            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))

            self?.viewController?.present(alert, animated: true)
        }
    }
    
}
