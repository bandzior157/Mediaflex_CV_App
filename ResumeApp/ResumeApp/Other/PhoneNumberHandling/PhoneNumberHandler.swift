//
//  PhoneNumberHandler.swift
//  ResumeApp
//
//  Created by Damian Tabański on 26/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import UIKit

class PhoneNumberHandler {
    
    private let application: UIApplication
    
    init(application: UIApplication = UIApplication.shared) {
        self.application = application
    }
    
}

extension PhoneNumberHandler: PhoneNumberHandling {
    
    func call(phoneNumber: String) throws {        
        let phoneNumber = phoneNumber.replacingOccurrences(of: " ", with: "", options: .literal)

        guard let url = URL(string: "tel://\(phoneNumber)") else {
            throw PhoneNumberHandlingError.wrongPhoneNumber
        }

        guard application.canOpenURL(url) else {
            throw PhoneNumberHandlingError.unableToCall
        }

        application.open(url)
    }
    
}
