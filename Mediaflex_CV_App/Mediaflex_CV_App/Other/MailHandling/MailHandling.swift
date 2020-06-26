//
//  MailHandling.swift
//  Mediaflex_CV_App
//
//  Created by Damian Tabański on 26/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

protocol MailHandling {
    func openMail(toRecipent recipent: String) throws
}
