//
//  PhoneNumberHandler.swift
//  Mediaflex_CV_App
//
//  Created by Damian Tabański on 26/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import UIKit

class PhoneNumberHandler: PhoneNumberHandling {
    
    private let application: UIApplication
    
    init(application: UIApplication = UIApplication.shared) {
        self.application = application
    }
    
    func call(phoneNumber: String) throws {
        guard let url = URL(string: "tel://\(phoneNumber)") else {
            throw PhoneNumberHandlingError.wrongPhoneNumber
        }
        
        guard application.canOpenURL(url) else {
            throw PhoneNumberHandlingError.unableToCall
        }
        
        application.open(url)
    }
}
