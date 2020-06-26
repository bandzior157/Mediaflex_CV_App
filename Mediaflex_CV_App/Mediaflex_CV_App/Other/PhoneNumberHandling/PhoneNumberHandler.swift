//
//  PhoneNumberHandler.swift
//  Mediaflex_CV_App
//
//  Created by Damian Tabański on 26/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import UIKit

class PhoneNumberHandler: PhoneNumberHandling {
    func call(phoneNumber: String) throws {
        guard let url = URL(string: "tel://\(phoneNumber)") else {
            throw PhoneNumberHandlingError.wrongPhoneNumber
        }
        
        guard UIApplication.shared.canOpenURL(url) else {
            throw PhoneNumberHandlingError.unableToCall
        }
        
        UIApplication.shared.open(url)
    }
}
